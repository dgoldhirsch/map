require "spec_helper"

describe "Event" do
  context "Event Guid" do
    before(:each) do
      Event.delete_all
      Guid.reset! 1 # next guid will be "1"
    end

    it "should create a string guid for the id" do
      x = Event.create!(:name => "One")
      x.id.should_not be_nil
      x.id.should be_is_a(String)
      x.id.should == "1"
    end

    it "should allow me to set the guid to a string" do
      x = Event.new(:name => "Another") # NOT create, because can't change an id once saved'
      x.id = "abc"
      x.save
      x.id.should == "abc"
    end
  end
end