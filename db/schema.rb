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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160103204442) do

  create_table "readings", force: :cascade do |t|
    t.float    "voltage"
    t.integer  "power"
    t.integer  "kva"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "ted_reader_id"
    t.datetime "ted_reader_time"
  end

  add_index "readings", ["ted_reader_id"], name: "index_readings_on_ted_reader_id"

  create_table "ted_readers", force: :cascade do |t|
    t.string   "hostname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
