class Event < ActiveRecord::Base

  has_many :attendees
  
  def before_create
    self.id = self.id || Guid.guid
  end
end
