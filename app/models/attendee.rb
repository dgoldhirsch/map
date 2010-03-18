module AttendeeDescription
  def to_s
    result = "#{user}"
    result = result + "!" if is_organizer
    result
  end
end

class Attendee < ActiveRecord::Base
  include GuidId
  include AttendeeDescription
  belongs_to :event
  belongs_to :user

  def organizer?
    self.is_organizer == true
  end
end
