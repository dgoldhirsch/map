class Event < ActiveRecord::Base

  def before_create
    self.id = self.id || Guid.guid
  end
end
