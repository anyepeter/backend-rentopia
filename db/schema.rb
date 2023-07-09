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

ActiveRecord::Schema[7.0].define(version: 2023_07_07_224403) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "description"
    t.bigint "user_id", null: false
    t.bigint "house_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_comments_on_house_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "title"
    t.integer "number_of_houses"
    t.decimal "price"
    t.string "metal_type"
    t.string "water_source"
    t.boolean "funitures"
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.bigint "security_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_houses_on_category_id"
    t.index ["location_id"], name: "index_houses_on_location_id"
    t.index ["security_id"], name: "index_houses_on_security_id"
    t.index ["user_id"], name: "index_houses_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.text "quater"
    t.decimal "longitude"
    t.decimal "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "near_by_places", force: :cascade do |t|
    t.string "name"
    t.decimal "distance"
    t.bigint "user_id", null: false
    t.bigint "house_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_near_by_places_on_house_id"
    t.index ["user_id"], name: "index_near_by_places_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "securities", force: :cascade do |t|
    t.boolean "gate"
    t.boolean "securityMan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "occupation"
    t.integer "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "houses"
  add_foreign_key "comments", "users"
  add_foreign_key "houses", "categories"
  add_foreign_key "houses", "locations"
  add_foreign_key "houses", "securities"
  add_foreign_key "houses", "users"
  add_foreign_key "near_by_places", "houses"
  add_foreign_key "near_by_places", "users"
end
