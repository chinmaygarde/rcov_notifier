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
      message = get_message_for_coverage(get_coverage_percentage(coverage_report_index_path))
      growl("Test Coverage", "#{coverage_percentage}% #{message}")
    end
  end
  
  def growl(title, message)
    n = GrowlNotifier.new('RCov Notifier', ['Notification'])
    n.register()
    n.notify('Notification', title, message)
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
end