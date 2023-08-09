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

ActiveRecord::Schema.define(version: 2023_07_04_065456) do

  create_table "camp_sites", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "post_code"
    t.string "address"
    t.string "phone_number"
    t.text "about"
    t.index ["email"], name: "index_camp_sites_on_email", unique: true
    t.index ["reset_password_token"], name: "index_camp_sites_on_reset_password_token", unique: true
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.text "about"
    t.integer "camp_site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camp_site_id"], name: "index_plans_on_camp_site_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "camp_site_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "price"
    t.bigint "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camp_site_id"], name: "index_reservations_on_camp_site_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name"
    t.string "first_name"
    t.string "last_name_kana"
    t.string "first_name_kana"
    t.string "phone_number"
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "post_code"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
