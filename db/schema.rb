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

ActiveRecord::Schema.define(version: 20180606031132) do

  create_table "home_category_mains", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_home_category_mains_on_name"
  end

  create_table "home_category_subs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_home_category_subs_on_name"

  create_table "amenities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "necessities", default: false
    t.boolean "wifi", default: false
    t.boolean "shampoo", default: false
    t.boolean "closet", default: false
    t.boolean "tv_set", default: false
    t.boolean "heating", default: false
    t.boolean "air_conditioner", default: false
    t.boolean "breakfast", default: false
    t.boolean "desk", default: false
    t.boolean "fireplace", default: false
    t.boolean "iron", default: false
    t.boolean "hair_dryer", default: false
    t.boolean "allowed_pet", default: false
    t.boolean "smoke_detector", default: false
    t.boolean "carbon_monoxide_detecter", default: false
    t.boolean "aid_set", default: false
    t.boolean "fire_extinguisher", default: false
    t.boolean "disaster_card", default: false
    t.boolean "keyed_door", default: false
    t.bigint "home_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_id"], name: "index_amenities_on_home_id"
  end

  create_table "available_spaces", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "dedicated_living", default: false
    t.boolean "pool", default: false
    t.boolean "kitchen", default: false
    t.boolean "washer_machine", default: false
    t.boolean "washer_dryer_machine", default: false
    t.boolean "parking", default: false
    t.boolean "elevator", default: false
    t.boolean "jacuzzi", default: false
    t.boolean "gym", default: false
    t.bigint "home_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_id"], name: "index_available_spaces_on_home_id"
  end

  create_table "home_rules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "accept_kids", default: false
    t.text "kids_reason"
    t.boolean "accept_babies", default: false
    t.text "babies_reason"
    t.boolean "accept_pet", default: false
    t.boolean "accept_smoking", default: false
    t.boolean "accept_event_party", default: false
    t.bigint "home_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_id"], name: "index_home_rules_on_home_id"
    
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

  create_table "home_notifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "only_stairs", default: false
    t.text "stairs_detail"
    t.boolean "noisy", default: false
    t.text "noisy_detail"
    t.boolean "pet_stayed", default: false
    t.text "pet_detail"
    t.boolean "no_parking", default: false
    t.text "parking_guide"
    t.boolean "shared_space", default: false
    t.text "shared_space_detail"
    t.boolean "limited_amenity", default: false
    t.text "limited_amenity_detail"
    t.boolean "surveillance_camera", default: false
    t.text "camera_detail"
    t.boolean "firearm", default: false
    t.text "firearm_detail"
    t.boolean "dangerous_animal", default: false
    t.text "animal_detail"
    t.bigint "home_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_id"], name: "index_home_notifications_on_home_id"
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
  
  create_table "hose_rules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "accept_kids", default: false
    t.text "kids_reason"
    t.boolean "accept_babies", default: false
    t.text "babies_reason"
    t.boolean "accept_pet", default: false
    t.boolean "accept_smoking", default: false
    t.boolean "accept_event_party", default: false
    t.bigint "home_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_id"], name: "index_hose_rules_on_home_id"
  end

  create_table "overviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "home_id", null: false
    t.text "overview", null: false
    t.text "about_listing"
    t.text "areas_available"
    t.text "communication_frequency"
    t.text "other_notices"
    t.text "area_information"
    t.text "transportation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_id"], name: "index_overviews_on_home_id"
  end

  create_table "prices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "pricing_method", null: false
    t.integer "default_price", null: false
    t.integer "muximum_price"
    t.integer "minimum_price"
    t.boolean "first_arrival_discount", default: false
    t.float "weekly_discount_rate", limit: 24, null: false
    t.float "monthly_discount_rate", limit: 24, null: false
    t.bigint "home_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_id"], name: "index_prices_on_home_id"
  end

  add_foreign_key "amenities", "homes"
  add_foreign_key "available_spaces", "homes"
  add_foreign_key "home_rules", "homes"
  add_foreign_key "hose_rules", "homes"
  add_foreign_key "overviews", "homes"
  add_foreign_key "prices", "homes"

  create_table "room_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "additional_home_rules", "homes"
  add_foreign_key "availability_settings", "homes"
  add_foreign_key "bed_types", "homes"
  add_foreign_key "home_notifications", "homes"
end
