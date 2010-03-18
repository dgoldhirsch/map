require "spec_helper"

describe "Event" do
  before(:each) do
    Event.delete_all
    Guid.reset! 1 # next guid will be "1"
  end

  context "Event Guid" do
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

  context "Event has many Users through Attendees" do
    before(:each) do
      @arnie = User.new(:name => "Arnie")
      @bjorn = User.new(:name => "Bjorn")
    end
    it "should associate users with an event through an attendee" do
      x = Event.create!(:name => "Ping pong tournament")
      arnie_plays = Attendee.create!(:user => @arnie, :is_organizer => true)
      bjorn_plays = Attendee.create!(:user => @bjorn)
      x.attendees << arnie_plays
      x.attendees << bjorn_plays
      x.save
      actual = Event.find(x.id)
      actual.should have(2).attendees
      actual.attendees.should be_include(arnie_plays)
      actual.attendees.should be_include(bjorn_plays)
      actual.users.should be_include(@arnie)
      actual.users.should be_include(@bjorn)
      actual.organizer.should == @arnie
    end
  end
end