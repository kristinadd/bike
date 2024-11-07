# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_10_11_121442) do
  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["name"], name: "index_cities_on_name", unique: true
  end

  create_table "reactions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ride_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reaction_type"
    t.index ["ride_id"], name: "index_reactions_on_ride_id"
    t.index ["user_id", "ride_id"], name: "index_reactions_on_user_id_and_ride_id", unique: true
    t.index ["user_id"], name: "index_reactions_on_user_id"
  end

  create_table "rides", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "start_city_id"
    t.integer "end_city_id"
    t.json "recommendation"
    t.integer "distance"
    t.integer "user_id"
    t.index ["end_city_id"], name: "index_rides_on_end_city_id"
    t.index ["start_city_id"], name: "index_rides_on_start_city_id"
    t.index ["user_id"], name: "index_rides_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.boolean "is_admin"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "rides", "cities", column: "end_city_id"
  add_foreign_key "rides", "cities", column: "start_city_id"
  add_foreign_key "rides", "users", on_delete: :cascade
  
  # add fk on_delete: :cascade for reactions, users, and rides
end
