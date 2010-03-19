class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :note_id
      t.text :details
      t.timestamps
    end
    add_foreign_key(:comments, :notes)    
  end

  def self.down
    drop_table :comments
  end
end
