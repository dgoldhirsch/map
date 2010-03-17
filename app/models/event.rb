class Event < ActiveRecord::Base
  include GuidId
  has_many :attendees
end
