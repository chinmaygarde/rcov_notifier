require 'rubygems'
require 'rbconfig'
require 'autotest'
require 'nokogiri'

require 'rcov_notifier/rcov_notifier'

Autotest.add_hook :waiting do
  notifier = RCovNotifier.new(File.expand_path(File.dirname(".")))
  notifier.report
end
