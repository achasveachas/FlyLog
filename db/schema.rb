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

ActiveRecord::Schema.define(version: 20161125052935) do

  create_table "airplanes", force: :cascade do |t|
    t.string "make"
    t.string "model"
  end

  create_table "flight_airplanes", force: :cascade do |t|
    t.integer "flight_id"
    t.integer "airplane_id"
    t.string  "tail_number"
    t.index ["airplane_id"], name: "index_flight_airplanes_on_airplane_id"
    t.index ["flight_id"], name: "index_flight_airplanes_on_flight_id"
  end

  create_table "flights", force: :cascade do |t|
    t.integer  "log_book_id"
    t.string   "origin"
    t.string   "destination"
    t.string   "instructor"
    t.text     "notes"
    t.integer  "duration",    default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.date     "date"
    t.index ["log_book_id"], name: "index_flights_on_log_book_id"
  end

  create_table "log_books", force: :cascade do |t|
    t.integer  "pilot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pilot_id"], name: "index_log_books_on_pilot_id"
  end

  create_table "pilot_ratings", force: :cascade do |t|
    t.integer  "pilot_id"
    t.integer  "rating_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pilot_id"], name: "index_pilot_ratings_on_pilot_id"
    t.index ["rating_id"], name: "index_pilot_ratings_on_rating_id"
  end

  create_table "pilots", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "age"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
  end

  create_table "ratings", force: :cascade do |t|
    t.string   "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
