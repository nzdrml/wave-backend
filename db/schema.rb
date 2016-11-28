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

ActiveRecord::Schema.define(version: 20161128094017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "rider_id"
    t.integer  "trip_id"
    t.decimal  "balance",    precision: 8, scale: 2, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["rider_id"], name: "index_bookings_on_rider_id", using: :btree
    t.index ["trip_id"], name: "index_bookings_on_trip_id", using: :btree
  end

  create_table "points", force: :cascade do |t|
    t.string "name",      null: false
    t.float  "latitude"
    t.float  "longitude"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
  end

  create_table "routes", force: :cascade do |t|
    t.decimal "price",          precision: 8, scale: 2, null: false
    t.integer "origin_id",                              null: false
    t.integer "destination_id",                         null: false
    t.index ["destination_id"], name: "index_routes_on_destination_id", using: :btree
    t.index ["origin_id"], name: "index_routes_on_origin_id", using: :btree
  end

  create_table "routes_schedules", id: false, force: :cascade do |t|
    t.integer "route_id",    null: false
    t.integer "schedule_id", null: false
    t.index ["route_id", "schedule_id"], name: "index_routes_schedules_on_route_id_and_schedule_id", using: :btree
    t.index ["schedule_id", "route_id"], name: "index_routes_schedules_on_schedule_id_and_route_id", using: :btree
  end

  create_table "schedules", force: :cascade do |t|
    t.string "time", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "driver_id"
    t.integer  "route_id",                                            null: false
    t.integer  "schedule_id",                                         null: false
    t.integer  "state",                               default: 0
    t.decimal  "balance",     precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.date     "trip_date",                                           null: false
    t.index ["driver_id"], name: "index_trips_on_driver_id", using: :btree
    t.index ["route_id"], name: "index_trips_on_route_id", using: :btree
    t.index ["schedule_id"], name: "index_trips_on_schedule_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                                         null: false
    t.string   "last_name",                                          null: false
    t.string   "phone",                                              null: false
    t.decimal  "balance",    precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.integer  "role_id"
    t.string   "email",                                              null: false
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
  end

  create_table "vehicles", force: :cascade do |t|
    t.string  "make",      null: false
    t.string  "plate",     null: false
    t.integer "driver_id"
    t.index ["driver_id"], name: "index_vehicles_on_driver_id", using: :btree
  end

end
