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

ActiveRecord::Schema.define(version: 2021_06_20_174007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clocks", force: :cascade do |t|
    t.datetime "checkin"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_clocks_on_user_id"
  end

  create_table "follow_relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followee_id"], name: "index_follow_relationships_on_followee_id"
    t.index ["follower_id", "followee_id"], name: "index_follow_relationships_on_follower_id_and_followee_id", unique: true
    t.index ["follower_id"], name: "index_follow_relationships_on_follower_id"
  end

  create_table "sleep_records", force: :cascade do |t|
    t.datetime "sleep_time"
    t.datetime "wake_time"
    t.integer "sleep_duration"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_sleep_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "clocks", "users"
  add_foreign_key "sleep_records", "users"
end
