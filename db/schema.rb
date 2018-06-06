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

ActiveRecord::Schema.define(version: 20180606030444) do

  create_table "additional_home_rules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "content", null: false
    t.bigint "home_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_id"], name: "index_additional_home_rules_on_home_id"
  end

  create_table "availability_settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "reservation_deadline"
    t.time "checkin_time_deadline_from"
    t.time "checkin_time_deadline_to"
    t.integer "acceptable_month_ahead"
    t.integer "muximum_accomodation_range"
    t.integer "minimum_accomodation_range"
    t.bigint "home_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_id"], name: "index_availability_settings_on_home_id"
  end

  create_table "bed_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "single_bed"
    t.integer "double_bed"
    t.integer "queen_bed"
    t.integer "sofa_bed"
    t.bigint "home_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_id"], name: "index_bed_types_on_home_id"
  end

  create_table "homes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "capacity", null: false
    t.integer "number_of_bedroom", null: false
    t.integer "number_of_bathroom", null: false
    t.boolean "bathroom_for_guest", null: false
    t.string "postalcode", null: false
    t.string "prefecture", null: false
    t.string "town", null: false
    t.string "street", null: false
    t.string "building", null: false
    t.integer "location_x", null: false
    t.integer "location_y", null: false
    t.string "name", null: false
    t.integer "invite_frequency", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_homes_on_name"
    t.index ["town"], name: "index_homes_on_town"
  end

  create_table "room_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "additional_home_rules", "homes"
  add_foreign_key "availability_settings", "homes"
  add_foreign_key "bed_types", "homes"
end
