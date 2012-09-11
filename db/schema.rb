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

ActiveRecord::Schema.define(:version => 20120910034919) do

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "games", :force => true do |t|
    t.datetime "played_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "num_holes"
    t.integer  "course_id"
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "scores", :force => true do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.integer  "hole01"
    t.integer  "hole02"
    t.integer  "hole03"
    t.integer  "hole04"
    t.integer  "hole05"
    t.integer  "hole06"
    t.integer  "hole07"
    t.integer  "hole08"
    t.integer  "hole09"
    t.integer  "hole10"
    t.integer  "hole11"
    t.integer  "hole12"
    t.integer  "hole13"
    t.integer  "hole14"
    t.integer  "hole15"
    t.integer  "hole16"
    t.integer  "hole17"
    t.integer  "hole18"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
