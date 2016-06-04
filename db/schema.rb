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

ActiveRecord::Schema.define(version: 20160604042640) do

  create_table "information", force: :cascade do |t|
    t.string   "title",                   null: false
    t.text     "content",                 null: false
    t.integer  "category_id"
    t.datetime "start_date"
    t.datetime "expire_date"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "participate"
    t.integer  "user_id",     default: 1
  end

  add_index "information", ["user_id"], name: "index_information_on_user_id"

  create_table "results", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "author_id",  default: 0, null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "information_id", null: false
    t.string   "comment"
    t.string   "comment2"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "tickets", ["information_id", "user_id"], name: "index_tickets_on_information_id_and_user_id", unique: true
  add_index "tickets", ["information_id"], name: "index_tickets_on_information_id"
  add_index "tickets", ["user_id", "information_id"], name: "index_tickets_on_user_id_and_information_id", unique: true
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id"

  create_table "timecards", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "timecards", ["user_id"], name: "index_timecards_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "token"
    t.boolean  "admin",                  default: false, null: false
    t.string   "grade"
    t.string   "school_name"
    t.string   "phone_number"
    t.boolean  "confirmed"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
