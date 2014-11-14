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

ActiveRecord::Schema.define(version: 20141112201340) do

  create_table "delivery_quests", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "reward"
    t.integer  "quest_giver_id"
    t.integer  "quester_id"
    t.integer  "source_id"
    t.integer  "destination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microposts", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"

  create_table "single_tasks", force: true do |t|
    t.integer  "requester_id"
    t.integer  "receiver_id"
    t.text     "description"
    t.text     "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "single_tasks", ["receiver_id"], name: "index_single_tasks_on_receiver_id"
  add_index "single_tasks", ["requester_id"], name: "index_single_tasks_on_requester_id"

  create_table "tasks", force: true do |t|
    t.integer  "requester_id"
    t.integer  "receiver_id"
    t.text     "description"
    t.text     "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["receiver_id"], name: "index_tasks_on_receiver_id"
  add_index "tasks", ["requester_id"], name: "index_tasks_on_requester_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
