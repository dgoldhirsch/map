require "spec_helper"

describe "Attendee class" do
  before(:each) do
    Event.delete_all
    Attendee.delete_all
    User.delete_all
    @alan = User.create!(:name => "Alan")
    @bart = User.create!(:name => "Bart")
    @event = Event.create!(:name => "One")
    @first_attendee = Attendee.new(:user => @alan)
    @event.attendees << @first_attendee # << saves the attendee to the database
  end

  context "Each Attendee has one User" do
    it "should find the user for an attendee" do
      @first_attendee.user.should == @alan
    end

    it "should permite changing the user for an attendee" do
      @first_attendee.user = @bart
      @first_attendee.user.should == @bart # Ensure assignment worked (in memory)
      @first_attendee.save
      Attendee.find(@first_attendee.id).user.should == @bart # Ensure assignment written to db
    end
  end

  context "Each Event has many Attendees" do
    it "should create an event with an attendee" do
      @event.should have(1).attendees
      @event.attendees.last.should == @first_attendee
      @first_attendee.event.should == @event
    end

    it "should allow more than one attendee in an event"  do
      second_attendee = Attendee.new(:user => @bart)
      @event.attendees << second_attendee
      @event.should have(2).attendees
      @event.attendees.should be_include(@first_attendee)
      @event.attendees.should be_include(second_attendee)
    end
  end
end