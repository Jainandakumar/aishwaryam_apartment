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

ActiveRecord::Schema.define(version: 20170807120549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartments", force: :cascade do |t|
    t.string   "name"
    t.string   "owner"
    t.string   "builder"
    t.text     "address"
    t.string   "locality"
    t.string   "city"
    t.integer  "postcode"
    t.string   "state"
    t.string   "country"
    t.integer  "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blocks", force: :cascade do |t|
    t.string   "name"
    t.integer  "apartment_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "flats", force: :cascade do |t|
    t.string   "name"
    t.integer  "floor_id"
    t.integer  "bed_room"
    t.float    "sq_ft"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "status",       default: true
    t.boolean  "availability", default: true
    t.float    "rent",         default: 0.0
  end

  create_table "flats_residents", force: :cascade do |t|
    t.integer  "resident_id"
    t.integer  "flat_id"
    t.boolean  "active"
    t.date     "from"
    t.date     "to"
    t.boolean  "family_head"
    t.boolean  "owner"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "floors", force: :cascade do |t|
    t.string   "name"
    t.integer  "block_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "months", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "residents", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "sex"
    t.integer  "phone"
    t.string   "email"
    t.boolean  "pet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "username"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "water_readings", force: :cascade do |t|
    t.float    "meter_1"
    t.float    "meter_2"
    t.float    "meter_3"
    t.integer  "flat_id"
    t.integer  "month_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
