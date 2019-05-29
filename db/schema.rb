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

ActiveRecord::Schema.define(version: 2019_05_29_225226) do

  create_table "boats", force: :cascade do |t|
    t.string "number"
    t.string "name"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_boats_on_number", unique: true
  end

  create_table "crew_trips", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "plan_id"
    t.index ["plan_id"], name: "index_crew_trips_on_plan_id"
    t.index ["user_id"], name: "index_crew_trips_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.time "time_out"
    t.text "weather_forecast"
    t.string "current"
    t.string "direction"
    t.boolean "checkout_complete"
    t.text "notes_out"
    t.time "time_in"
    t.boolean "checkin_complete"
    t.text "notes_in"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.integer "boat_id"
    t.integer "skipper_id"
    t.index ["boat_id"], name: "index_plans_on_boat_id"
    t.index ["skipper_id"], name: "index_plans_on_skipper_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.boolean "skipper", default: false
    t.string "mobile"
    t.string "remember_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
