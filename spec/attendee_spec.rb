require "spec_helper"

describe "Attendee class" do
  before(:each) do
    Event.delete_all
    Attendee.delete_all
    @event = Event.create!(:name => "One")
    @first_attendee = Attendee.new
    @event.attendees << @first_attendee
  end

  it "should create an event with an attendee" do
    @event.should have(1).attendees
    @event.attendees.last.should == @first_attendee
    @first_attendee.event.should == @event
  end

  it "should allow more than one attendee in an event"  do
    second_attendee = Attendee.new
    @event.attendees << second_attendee
    @event.should have(2).attendees
    @event.attendees.should be_include(@first_attendee)
    @event.attendees.should be_include(second_attendee)
  end
end