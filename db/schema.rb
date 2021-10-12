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

ActiveRecord::Schema.define(version: 2021_09_29_212219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_users", force: :cascade do |t|
    t.string "name"
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_users_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "typeName"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "namePhoto"
    t.string "url"
    t.binary "data"
    t.string "fileName"
    t.string "mimeType"
    t.bigint "user_id", null: false
    t.bigint "group_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_user_id"], name: "index_photos_on_group_user_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "comment"
    t.integer "rating"
    t.bigint "photo_id", null: false
    t.bigint "group_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_user_id"], name: "index_reviews_on_group_user_id"
    t.index ["photo_id"], name: "index_reviews_on_photo_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.date "dateObird"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "groups", "users"
  add_foreign_key "photos", "group_users"
  add_foreign_key "photos", "users"
  add_foreign_key "reviews", "group_users"
  add_foreign_key "reviews", "photos"
end
