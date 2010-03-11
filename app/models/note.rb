class Note < ActiveRecord::Base
  def before_create
    self.id = Guid.guid
  end
end
