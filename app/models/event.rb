module EventDescription
  def to_s
    "#{name} users: " + (attendees.collect {|a| a.to_s }).join(", ")
  end
end

class Event < ActiveRecord::Base
  include EventDescription
  include GuidId
  has_many :attendees
  has_many :users, :through => :attendees

  def organizer
    result = organizing_attendee
    result ? result.user : nil
  end

  def organizing_attendee
    attendees.detect {|a| a.organizer? }
  end

end
