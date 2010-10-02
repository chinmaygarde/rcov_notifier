class RCovNotifier
  @@coverage_dir = "coverage"
  @@threshold_percent = 100
  
  GEM_PATH = File.expand_path(File.join(File.dirname(__FILE__), "..", ".."))
  
  def self.coverage_dir=(name)
    @@coverage_dir = name
  end
  
  def self.threshold_percent=(percent)
    @@threshold_percent = percent
  end
  
  def initialize(project_path)
    @project_path = project_path
  end
  
  def image_path(image_name)
    File.join(GEM_PATH, "images", image_name)
  end
  
  def coverage_report_index_path
    File.join(File.expand_path(@project_path), @@coverage_dir, "index.html")
  end
  
  def report
    if !File.exists?(coverage_report_index_path)
      growl("Not Found", "Could not file coverage report files at #{coverage_report_index_path}")
    else
      coverage_percentage = get_coverage_percentage(coverage_report_index_path)
      message = get_message_for_coverage(coverage_percentage)
      growl("Test Coverage", "#{coverage_percentage}% #{message}", select_image(coverage_percentage))
    end
  end
  
  def growl(title, message, icon="application.png", priority=0, sticky=false)
    growl = File.join(GEM_PATH, 'growl', 'growlnotify')
    image = image_path(icon)
    case Config::CONFIG['host_os']
    when /mac os|darwin/i
      options = "-w -n Autotest --image '#{image}' -p #{priority} -m '#{message}' '#{title}' #{'-s' if sticky}"
      system %(#{growl} #{options} &)
    when /linux|bsd/i
      system %(notify-send "#{title}" "#{message}" -i #{image} -t 5000)
    when /windows|mswin|mingw|cygwin/i
      growl += '.com'
      system %(#{growl} #{message.inspect} /a:"Autotest" /r:"Autotest" /n:"Autotest" /i:"#{image}" /p:#{priority} /t:"#{title}" /s:#{sticky})
    else
      raise "#{Config::CONFIG['host_os']} is not supported by autotest-growl (feel free to submit a patch)" 
    end
  end
  
  def get_message_for_coverage(coverage_percentage)
    message = "coverage."
    case coverage_percentage
    when 100
      message = "coverage. Pure awesomeness"
    when (@@threshold_percent .. 100)
      message = "coverage. You're on target :)"
    when (0 .. @@threshold_percent)
      message = "coverage. Not enough. Try harder!"
    end
  end
  
  def get_coverage_percentage(file_path)
    doc = Nokogiri::HTML(File.open(file_path, "r").read)
    doc.at_css('tfoot .percent_graph_legend tt').text.match(/[0-9.]+/).to_s.to_f
  end
  
  def select_image(percentage)

    display_num = 100
    case percentage
    when (80 .. 100)
      display_num = 100
    when (60 .. 80)
      display_num = 80
    when (40 .. 60)
      display_num = 60
    when (20 .. 40)
      display_num = 40
    when (0 .. 20)
      display_num = 20
    end
    below_threshold?(percentage) ? "#{display_num}_red.png" : "#{display_num}_green.png"
  end
  
  def below_threshold?(percentage)
    percentage < @@threshold_percent
  end
end