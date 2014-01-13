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

ActiveRecord::Schema.define(version: 20140112162519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "addresses", force: true do |t|
    t.string   "address_type"
    t.string   "country"
    t.string   "zip_code"
    t.string   "address_line"
    t.string   "phone"
    t.integer  "loan_request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", force: true do |t|
    t.string   "document_type"
    t.string   "series"
    t.integer  "number"
    t.string   "personal_number"
    t.string   "issued_by"
    t.date     "issued_at"
    t.date     "expires_at"
    t.string   "latin_name"
    t.string   "latin_surname"
    t.integer  "loan_request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "company_name"
    t.string   "upid"
    t.string   "working_phone"
    t.string   "personnel_department_phone"
    t.string   "accounting_department_phone"
    t.string   "position"
    t.date     "empoyed_at"
    t.integer  "loan_request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loan_requests", force: true do |t|
    t.integer  "sum"
    t.string   "interval"
    t.string   "current_location_type"
    t.integer  "dependants_count"
    t.integer  "average_income"
    t.boolean  "has_real_estate"
    t.boolean  "has_car"
    t.boolean  "lives_by_registration_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "profiles", force: true do |t|
    t.string   "name"
    t.string   "middle_name"
    t.string   "surname"
    t.string   "previous_surname"
    t.string   "gender"
    t.date     "birthdate"
    t.string   "origin_country"
    t.string   "birthplace"
    t.string   "education"
    t.string   "marital_status"
    t.string   "mobile_phone"
    t.string   "email"
    t.integer  "loan_request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.integer  "uid"
    t.string   "email"
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", force: true do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
