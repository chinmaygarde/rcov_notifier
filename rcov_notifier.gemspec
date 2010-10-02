# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rcov_notifier}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chinmay Garde"]
  s.date = %q{2010-10-02}
  s.description = %q{Get RCov notifications via Growl. More on GitHub}
  s.email = %q{chinmaygarde@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "PostInstall.txt",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "images/application.png",
     "images/img.png",
     "images/status.png",
     "lib/rcov_notifier.rb",
     "lib/rcov_notifier/growl.rb",
     "lib/rcov_notifier/rcov_notifier.rb",
     "rcov_notifier.gemspec",
     "spec/rcov_notifier_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/chinmaygarde/rcov_notifier}
  s.post_install_message = %q{
[1;32m----------------------------------------------------
----------------------------------------------------

Add the following to your ~/.autotext file

	require 'rcov_notifier'

----------------------------------------------------
----------------------------------------------------[0m
}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Get RCov notifications via Growl}
  s.test_files = [
    "spec/rcov_notifier_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
  end
end

