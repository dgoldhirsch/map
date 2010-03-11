require 'spec_helper'

describe "Note model" do
  before(:each) do
    Note.delete_all
    Guid.reset! 1 # next guid will be "1"
  end

  it "should create a string guid for the id" do
    x = Note.create!(:name => "One")
    x.id.should_not be_nil
    x.id.should be_is_a(String)
    x.id.should == "1"
  end
end