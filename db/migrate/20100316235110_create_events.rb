class CreateEvents < ActiveRecord::Migration

  def self.up
    create_table :events, :id => false do |t|
      t.string :id
      t.string :name
      t.timestamps
    end
    add_index :events, :id, :unique => true
  end

  def self.down
    drop_table :events
  end
end
