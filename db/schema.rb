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

ActiveRecord::Schema.define(version: 2020_03_09_233932) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "name"
    t.text "ddescription"
    t.text "cdescription"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "consumer_id"
    t.integer "dealer_id"
    t.float "latitude"
    t.float "longitude"
    t.index ["consumer_id"], name: "index_cars_on_consumer_id"
    t.index ["dealer_id"], name: "index_cars_on_dealer_id"
  end

  create_table "consumers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_consumers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_consumers_on_reset_password_token", unique: true
  end

  create_table "dealers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_dealers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_dealers_on_reset_password_token", unique: true
  end

  create_table "descriptions", force: :cascade do |t|
    t.text "message"
    t.string "rating"
    t.integer "dealer_id"
    t.integer "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_descriptions_on_car_id"
    t.index ["dealer_id", "car_id"], name: "index_descriptions_on_dealer_id_and_car_id"
  end

  create_table "photos", force: :cascade do |t|
    t.text "caption"
    t.integer "consumer_id"
    t.integer "dealer_id"
    t.integer "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.index ["car_id"], name: "index_photos_on_car_id"
    t.index ["dealer_id", "car_id"], name: "index_photos_on_dealer_id_and_car_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "message"
    t.string "rating"
    t.integer "consumer_id"
    t.integer "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_reviews_on_car_id"
    t.index ["consumer_id", "car_id"], name: "index_reviews_on_consumer_id_and_car_id"
  end

end