require 'faker'

  photo_urls = ["https://a0.muscache.com/im/pictures/b276ff50-8b02-4a93-bf4c-41b417c5ed0f.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/6542ecee-d182-4021-8bba-fcfc174bde8a.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/729c7866-aa4b-47e6-afcd-d33c2911d291.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/4ee29944-f6ae-416d-8501-c8e8f53a16f1.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/081ad464-0240-4712-9e80-2c6b64aeada6.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/6829aa8f-5aa5-41f8-9fe0-05abe5825243.jpg?aki_policy=large","https://a0.muscache.com/4ea/air/v2/pictures/19969bcd-dd7f-407e-8c33-3912ae713f21.jpg?t=r:w1200-h720-sfit,e:fjpg-c90","https://a0.muscache.com/im/pictures/12dd33c0-a66e-4288-8fd9-8d77ec389a26.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/48d97e17-8a7a-4e11-92b2-80512484f52b.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/61566443/79e8ff67_original.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/720779cd-2272-4f05-891e-50a49b20c616.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/3f02b23f-95cc-4dc8-bdba-1c3993420d1e.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/b89def39-54f7-4555-ade8-cbe44212a094.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/12dd33c0-a66e-4288-8fd9-8d77ec389a26.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/d0ca5230-3146-4fd0-aff9-273616db72dd.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/97555979/877f8f00_original.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/47985619/11203a2d_original.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/fbbf599d-1c7e-40c0-ac6e-91676dc57cc3.jpg?aki_policy=large","https://a0.muscache.com/4ea/air/v2/pictures/29de5153-eff5-45b7-853d-5f38cb65189f.jpg?t=r:w1200-h720-sfit,e:fjpg-c90","https://a0.muscache.com/im/pictures/da85a3d3-b2ff-4294-9ec5-12a85a2a508d.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/7c61a183-9710-4e7c-b6a4-62ff0d2549ab.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/72386260/6ecc8e27_original.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/20496765/0cde0964_original.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/33349213/95497a96_original.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/15985472/2634e9e9_original.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/51928238/35adf4fc_original.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/10858768/acf977fd_original.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/32556126/07d87e67_original.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/102022616/71295b9c_original.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/43912798/58d6cf81_original.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/2754991/036f7acf_original.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/16053263/d097c405_original.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/13822881/7635c8ac_original.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/16906758/6c5d77bb_original.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/36100306/1768acf3_original.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/ac3dcabb-ce9e-41a8-9bff-c8b153083694.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/13334919/a070e2b3_original.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/63925564/c99277b7_original.jpg?aki_policy=large","https://a0.muscache.com/im/pictures/3c2396bb-2a36-42ad-9b23-bcfcc47e4bc2.jpg?aki_policy=large"]


  def make_boolean
    return Faker::Boolean.boolean(0.5)
  end

  def make_text
    return Faker::Hacker.say_something_smart
  end

  def make_text_btf
    return Faker::BackToTheFuture.quote
  end

1.times do |n|

  home_id   = n
  user_id   = n
  rand_1to5 = rand(1..5)

  Home.create(
    capacity: rand(1..50),
    number_of_bedroom: rand(1..10),
    number_of_bathroom: rand_1to5,
    number_of_beds: rand(1..10),
    postalcode: Faker::Address.postcode,
    prefecture: Faker::Address.state,
    town: Faker::Pokemon.location,
    street: Faker::Address.street_name,
    building: Faker::OnePiece.character + "building",
    location_x: Faker::Address.latitude,
    location_y: Faker::Address.longitude,
    name: Faker::OnePiece.character + "'s house",
    home_category_sub_id: rand(1..12),
    country_id: rand(1..30),
    room_type_id: rand(1..2),
    user_id: user_id
  )

  # Country.create(
  #   name: Faker::Address.country
  #   # created_at: created_at,
  #   # updated_at: updated_at
  # )

  Amenity.create(
    necessities:              make_boolean,
    wifi:                     make_boolean,
    shampoo:                  make_boolean,
    closet:                   make_boolean,
    tv_set:                   make_boolean,
    heating:                  make_boolean,
    air_conditioner:          make_boolean,
    breakfast:                make_boolean,
    desk:                     make_boolean,
    fireplace:                make_boolean,
    iron:                     make_boolean,
    hair_dryer:               make_boolean,
    allowed_pet:              make_boolean,
    smoke_detector:           make_boolean,
    carbon_monoxide_detecter: make_boolean,
    aid_set:                  make_boolean,
    fire_extinguisher:        make_boolean,
    disaster_card:            make_boolean,
    keyed_door:               make_boolean,
    home_id:                  home_id
    # created_at: created_at,
    # updated_at: updated_at
  )


  AvailabilitySetting.create(
    reservation_deadline: rand(1..10),
    checkin_time_deadline_from: nil,
    checkin_time_deadline_to: nil,
    acceptable_month_ahead: rand(3..10),
    muximum_accomodation_range: rand(5..100),
    minimum_accomodation_range: rand(1..2),
    home_id: home_id
  )

  AvailableSpace.create(
    dedicated_living: make_boolean,
    pool: make_boolean,
    kitchen: make_boolean,
    washer_machine: make_boolean,
    washer_dryer_machine: make_boolean,
    parking: make_boolean,
    elevator: make_boolean,
    jacuzzi: make_boolean,
    gym: make_boolean,
    home_id: home_id,
    text: make_text
    )

  BedType.create(
    single_bed: rand(1..10),
    double_bed: rand(0..3),
    queen_bed: rand(0..3),
    sofa_bed: rand(0..3),
    home_id: home_id
    )

  only_stairs         = make_boolean
  noisy               = make_boolean
  pet_stayed          = make_boolean
  no_parking          = make_boolean
  shared_space        = make_boolean
  limited_amenity     = make_boolean
  surveillance_camera = make_boolean
  firearm             = make_boolean
  dangerous_animal    = make_boolean

  def detail(boolean_data)
   detail_data = boolean_data ? make_text : nil
   return detail_data
  end

  HomeNotification.create(
    only_stairs: only_stairs,
    stairs_detail: detail(only_stairs),
    noisy: noisy,
    noisy_detail: detail(noisy),
    pet_stayed: pet_stayed,
    pet_detail: detail(pet_stayed),
    no_parking: no_parking,
    parking_guide: detail(no_parking),
    shared_space: shared_space,
    shared_space_detail: detail(shared_space),
    limited_amenity: limited_amenity,
    limited_amenity_detail: detail(limited_amenity),
    surveillance_camera: surveillance_camera,
    camera_detail: detail(surveillance_camera),
    firearm: firearm,
    firearm_detail: detail(firearm),
    dangerous_animal: dangerous_animal,
    animal_detail: detail(dangerous_animal),
    home_id: home_id
    )

  def reason
    return "The reason why " + Faker::SiliconValley.motto
  end

  HomeRule.create(
    accept_kids: make_boolean,
    kids_reason: reason,
    accept_babies: make_boolean,
    babies_reason: reason,
    accept_pet: make_boolean,
    accept_smoking: make_boolean,
    accept_event_party: make_boolean,
    home_id: home_id
    )

  3.times do
    ListingPhoto.create(
      image: photo_urls[rand(0..38)],
      user_id: user_id,
      home_id: home_id
    )
  end

  Overview.create(
    home_id: home_id,
    overview: make_text_btf,
    about_listing: make_text_btf,
    areas_available: make_text_btf,
    communication_frequency: make_text_btf,
    other_notices: make_text_btf,
    area_information: make_text_btf,
    transportation: make_text_btf
  )

  Price.create(
    pricing_method: 1,
    default_price: rand(1000..10000),
    muximum_price: 20000,
    minimum_price: 1000,
    first_arrival_discount: make_boolean,
    weekly_discount_rate: rand(0..0.5),
    monthly_discount_rate: rand(0..0.7),
    home_id: home_id,
    service_fee: rand(500..3000),
    additional_fee_from: rand(1..5),
    additional_fee_per_person: rand(100..3000)
  )

  # create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
  #   t.string "email", default: "", null: false
  #   t.string "encrypted_password", default: "", null: false
  #   t.string "reset_password_token"
  #   t.datetime "reset_password_sent_at"
  #   t.datetime "remember_created_at"
  #   t.integer "sign_in_count", default: 0, null: false
  #   t.datetime "current_sign_in_at"
  #   t.datetime "last_sign_in_at"
  #   t.string "current_sign_in_ip"
  #   t.string "last_sign_in_ip"
  #   t.string "confirmation_token"
  #   t.datetime "confirmed_at"
  #   t.datetime "confirmation_sent_at"
  #   t.string "unconfirmed_email"
  #   t.string "name", null: false
  #   t.date "birth_day", null: false
  #   t.integer "sex", null: false
  #   t.string "phone_number", null: false
  #   t.string "postal_code", null: false
  #   t.string "prefecture", null: false
  #   t.string "town", null: false
  #   t.string "street", null: false
  #   t.string "building", null: false
  #   t.text "self_introduction", null: false
  #   t.bigint "country_id", null: false
  #   t.bigint "currency_id", null: false
  #   t.bigint "language_id", null: false
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.integer "status", null: false
  #   t.integer "superhost", default: 0
  # end

end














