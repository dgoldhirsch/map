# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100317003244) do

  create_table "attendees", :id => false, :force => true do |t|
    t.string   "id"
    t.string   "event_id"
    t.string   "user_id"
    t.boolean  "is_organizer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendees", ["id"], :name => "index_attendees_on_id", :unique => true

  create_table "comments", :force => true do |t|
    t.string   "note_id"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :id => false, :force => true do |t|
    t.string   "id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["id"], :name => "index_events_on_id", :unique => true

  create_table "notes", :id => false, :force => true do |t|
    t.string   "id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["id"], :name => "index_notes_on_id", :unique => true

  create_table "users", :id => false, :force => true do |t|
    t.string   "id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["id"], :name => "index_users_on_id", :unique => true

end
