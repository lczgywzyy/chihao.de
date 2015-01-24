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

ActiveRecord::Schema.define(version: 20140804223848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: :cascade do |t|
    t.string  "name"
    t.integer "province_id"
  end

  create_table "counties", force: :cascade do |t|
    t.string  "name"
    t.integer "province_id"
    t.integer "city_id"
    t.string  "zipcode"
    t.string  "phonecode"
  end

  create_table "courses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_specifications", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.integer  "recipe_id"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "attend_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price"
    t.decimal  "sum"
    t.string   "delivery_address"
    t.string   "delivery_mobile"
    t.string   "delivery_name"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.text     "description"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "recipes", ["name", "restaurant_id"], name: "index_recipes_on_name_and_restaurant_id", unique: true, using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "recipe_id"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "phone3"
    t.string   "phone4"
    t.string   "phone5"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "address"
    t.integer  "user_id"
    t.integer  "province_id"
    t.integer  "city_id"
    t.integer  "county_id"
    t.integer  "address_id"
    t.string   "range"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "mobile"
    t.string   "QQ"
    t.string   "weixin"
    t.string   "wangwang"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "restaurant_id"
    t.integer  "rank"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
