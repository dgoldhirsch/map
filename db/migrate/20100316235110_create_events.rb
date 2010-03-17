class CreateEvents < ActiveRecord::Migration

  def self.up
    create_table :events, :id => false do |t|
      t.string :id
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
