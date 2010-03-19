class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes, :id => false do |t|
      t.string :id
      t.string :name
      t.timestamps
    end

    add_index :notes, :id, :unique => true

  end

  def self.down
    drop_table :notes
  end
end
