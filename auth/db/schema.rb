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

ActiveRecord::Schema.define(version: 20140107122820) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "oauth2_access_tokens", force: true do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.integer  "refresh_token_id"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth2_access_tokens", ["client_id"], name: "index_oauth2_access_tokens_on_client_id", using: :btree
  add_index "oauth2_access_tokens", ["expires_at"], name: "index_oauth2_access_tokens_on_expires_at", using: :btree
  add_index "oauth2_access_tokens", ["token"], name: "index_oauth2_access_tokens_on_token", unique: true, using: :btree
  add_index "oauth2_access_tokens", ["user_id"], name: "index_oauth2_access_tokens_on_user_id", using: :btree

  create_table "oauth2_authorization_codes", force: true do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth2_authorization_codes", ["client_id"], name: "index_oauth2_authorization_codes_on_client_id", using: :btree
  add_index "oauth2_authorization_codes", ["expires_at"], name: "index_oauth2_authorization_codes_on_expires_at", using: :btree
  add_index "oauth2_authorization_codes", ["token"], name: "index_oauth2_authorization_codes_on_token", unique: true, using: :btree
  add_index "oauth2_authorization_codes", ["user_id"], name: "index_oauth2_authorization_codes_on_user_id", using: :btree

  create_table "oauth2_clients", force: true do |t|
    t.string   "name"
    t.string   "redirect_uri"
    t.string   "website"
    t.string   "identifier"
    t.string   "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth2_clients", ["identifier"], name: "index_oauth2_clients_on_identifier", unique: true, using: :btree

  create_table "oauth2_refresh_tokens", force: true do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth2_refresh_tokens", ["client_id"], name: "index_oauth2_refresh_tokens_on_client_id", using: :btree
  add_index "oauth2_refresh_tokens", ["expires_at"], name: "index_oauth2_refresh_tokens_on_expires_at", using: :btree
  add_index "oauth2_refresh_tokens", ["token"], name: "index_oauth2_refresh_tokens_on_token", unique: true, using: :btree
  add_index "oauth2_refresh_tokens", ["user_id"], name: "index_oauth2_refresh_tokens_on_user_id", using: :btree

  create_table "permissions", force: true do |t|
    t.string   "action"
    t.string   "subject"
    t.boolean  "owning_required"
    t.integer  "subject_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

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
