# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120414051201) do

  create_table "modes", :force => true do |t|
    t.string   "label"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vim_commands", :force => true do |t|
    t.string   "mode_id"
    t.string   "command"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "language"
  end

  add_index "vim_commands", ["language", "mode_id", "command"], :name => "index_vim_commands_on_language_and_mode_id_and_command"

end
