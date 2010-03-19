class CreateAttendees < ActiveRecord::Migration
  def self.up
    create_table :attendees, :id => false do |t|
      t.string :id
      t.string :event_id
      t.string :user_id
      t.boolean :is_organizer
      t.timestamps
    end
    add_index :attendees, :id, :unique => true    
    add_foreign_key(:attendees, :events)
    add_foreign_key(:attendees, :users)
  end

  def self.down
    drop_table :attendees
  end
end
