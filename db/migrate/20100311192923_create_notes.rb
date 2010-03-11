class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes, :id => false do |t|
      t.string :id
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
