class CreateAttendees < ActiveRecord::Migration
  def self.up
    create_table :attendees, :id => false do |t|
      t.string :id
      t.string :event_id
      t.string :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :attendees
  end
end
