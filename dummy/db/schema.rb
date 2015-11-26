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

ActiveRecord::Schema.define(version: 20151126132419) do

  create_table "system_notification_messages", force: :cascade do |t|
    t.integer  "user_id",                    null: false
    t.boolean  "seen",       default: false, null: false
    t.boolean  "dismiss",    default: false, null: false
    t.integer  "level",      default: 0,     null: false
    t.text     "text"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "system_notification_messages", ["user_id", "dismiss"], name: "idx_message_dismiss"
  add_index "system_notification_messages", ["user_id", "seen"], name: "idx_message_seen"

end
