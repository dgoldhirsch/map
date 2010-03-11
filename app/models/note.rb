class Note < ActiveRecord::Base

  has_many :comments
  
  def before_create
    self.id = Guid.guid
  end
end
