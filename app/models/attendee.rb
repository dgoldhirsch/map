class Attendee < ActiveRecord::Base
  include GuidId
  belongs_to :event
  belongs_to :user
end
