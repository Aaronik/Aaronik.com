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

ActiveRecord::Schema.define(version: 20130826123850) do

  create_table "finger_prints", force: true do |t|
    t.text     "finger_print"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "infos", force: true do |t|
    t.string   "ip"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "visit_count"
  end

  create_table "ips", force: true do |t|
    t.string   "ip"
    t.integer  "count"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "finger_print_id"
  end

end
