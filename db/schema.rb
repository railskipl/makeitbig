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

ActiveRecord::Schema.define(version: 20131219060036) do

  create_table "big_deals", force: true do |t|
    t.string   "name"
    t.string   "store_name"
    t.string   "email"
    t.string   "phone"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "image"
    t.text     "message"
    t.boolean  "active",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "country"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "categories", force: true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "impressions", force: true do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", length: {"impressionable_type"=>nil, "message"=>255, "impressionable_id"=>nil}, using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "plans", force: true do |t|
    t.string   "name"
    t.decimal  "price",      precision: 10, scale: 0
    t.integer  "limit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_images", force: true do |t|
    t.string   "image"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "product_images", ["product_id"], name: "index_product_images_on_product_id", using: :btree
  add_index "product_images", ["user_id"], name: "index_product_images_on_user_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price",            precision: 10, scale: 0
    t.boolean  "is_available",                              default: true
    t.boolean  "warranty",                                  default: true
    t.integer  "user_id"
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_image_id"
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.string   "meta_keywords"
    t.text     "meta_description"
    t.string   "offer"
    t.boolean  "featured",                                  default: false
    t.string   "slug"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["slug"], name: "index_products_on_slug", unique: true, using: :btree
  add_index "products", ["store_id"], name: "index_products_on_store_id", using: :btree
  add_index "products", ["subcategory_id"], name: "index_products_on_subcategory_id", using: :btree
  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

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

  create_table "reviews", force: true do |t|
    t.string   "name"
    t.integer  "stars"
    t.string   "comments"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["product_id"], name: "index_reviews_on_product_id", using: :btree

  create_table "stores", force: true do |t|
    t.string   "owner_name"
    t.string   "email"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string  "phone"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "currency",   default: "Rs."
    t.float    "latitude"
    t.float    "longitude"
    t.string   "slug"
    t.boolean  "gmaps"
  end

  add_index "stores", ["slug"], name: "index_stores_on_slug", unique: true, using: :btree
  add_index "stores", ["user_id"], name: "index_stores_on_user_id", using: :btree

  create_table "subcategories", force: true do |t|
    t.string   "subcategory"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "plan_id",                default: 1
    t.boolean  "admin",                  default: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["plan_id"], name: "index_users_on_plan_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
