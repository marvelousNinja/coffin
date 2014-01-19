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

ActiveRecord::Schema.define(version: 20140119051020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "credit_products", force: true do |t|
    t.string   "name"
    t.integer  "sum_policy_id"
    t.integer  "duration_policy_id"
    t.integer  "fine_policy_id"
    t.integer  "payment_policy_id"
    t.integer  "percent_policy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "loan_agreements", force: true do |t|
    t.integer  "initial_loan_sum"
    t.decimal  "loan_percent"
    t.integer  "duration"
    t.decimal  "fine_percent"
    t.string   "payment_method"
    t.decimal  "advanced_repayment_percent"
    t.integer  "credit_product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",                     default: "not_approved"
    t.integer  "user_id"
  end

  create_table "payments", force: true do |t|
    t.integer  "basic_part"
    t.integer  "percent_part"
    t.date     "scheduled_at"
    t.boolean  "processed",         default: false
    t.integer  "sum"
    t.integer  "loan_agreement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "policies", force: true do |t|
    t.decimal  "min",                       default: 0.0
    t.decimal  "max",                       default: 0.0
    t.string   "period"
    t.boolean  "fixed",                     default: false
    t.string   "type"
    t.text     "payment_methods",           default: [],    array: true
    t.boolean  "allows_advanced_repayment"
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
