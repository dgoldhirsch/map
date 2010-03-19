# include this module within your ActiveRecord subclass X, and then
# hack the db migration for X such that the id column is not auto-incremented but is a string:
#
#  create_table :events, :id => false do |t|
#    t.string :id
#    t.string :name
#    t.timestamps
#  end
module GuidId

  # Add callback to block that assigns a Guid if necessary.
  # Question for the Newbie Rails programmer:  why do it this way, instead of (say)
  # simply def'ing our own before_validation_on_create method?
  # Answer hint:  what if something else included by the caller overrides that same call-back method?
  def self.included(base)
    base.send(:before_validation_on_create) do |record|
      record.id ||= Guid.guid
    end
  end
end