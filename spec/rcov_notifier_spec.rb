require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "RcovNotifier" do
  before(:each) do
    @notifier = RCovNotifier.new(File.dirname(__FILE__))
  end
  
  it "should correctly find gem path" do
    @notifier.gem_path.should == File.expand_path(File.join(File.dirname(__FILE__), ".."))
  end
  
  it "should correctly resolve image paths" do
    @notifier.image_path("application.png").should == File.join(@notifier.gem_path, "images", "application.png")
  end
  
  it "should show growl message" do
    @notifier.show_growl_message("Foo", "Bar")
  end
end
