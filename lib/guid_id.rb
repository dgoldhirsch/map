# include this module within your ActiveRecord subclass X, and then
# hack the db migration for X such that the id column is not auto-incremented but is a string:
#
#  create_table :events, :id => false do |t|
#    t.string :id
#    t.string :name
#    t.timestamps
#  end
module GuidId
  def before_create
    self.id = self.id || Guid.guid
  end
end