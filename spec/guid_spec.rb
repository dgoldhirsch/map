require "spec_helper"

describe "Guid class" do
  before(:each) do
    Guid.reset!(1) # next peek or guid call will see "1"
  end

  it "should peek properly" do
    Guid.peek.should == "1"
  end

  it "should advance properly" do
    y = Guid.guid
    y.should == "1"
    Guid.peek.should == "2"
    z = Guid.guid
    z.should == "2"
    Guid.peek.should == "3"
    y.should_not == z
  end
end