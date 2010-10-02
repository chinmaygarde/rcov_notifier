require 'nokogiri'
require 'rcov_notifier/rcov_notifier'
require 'rcov_notifier/growl'

Autotest.add_hook :waiting do
  notifier = RCovNotifier.new(File.expand_path(File.dirname(".")))
  notifier.report
end
