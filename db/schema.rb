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

ActiveRecord::Schema.define(version: 20150717220530) do

  create_table "mount_points", force: :cascade do |t|
    t.string   "name"
    t.string   "format"
    t.string   "password"
    t.integer  "production_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "productions", force: :cascade do |t|
    t.string   "title"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: :cascade do |t|
    t.string "mqtt_server"
    t.string "mqtt_password"
    t.string "mqtt_username"
    t.text   "welcome_description"
    t.string "icecast_server"
    t.string "api_key"
  end

  create_table "user_sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_sessions", ["session_id"], name: "index_user_sessions_on_session_id"
  add_index "user_sessions", ["updated_at"], name: "index_user_sessions_on_updated_at"

  create_table "users", force: :cascade do |t|
    t.string   "login",                               null: false
    t.string   "crypted_password",                    null: false
    t.string   "password_salt",                       null: false
    t.string   "persistence_token",                   null: false
    t.string   "single_access_token",                 null: false
    t.string   "perishable_token",                    null: false
    t.boolean  "admin",               default: false
    t.string   "village"
    t.string   "dect"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
