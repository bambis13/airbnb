100.times do |n|

  capacity = rand(0..9)
  number_of_bedroom = rand(0..9)
  number_of_bathroom = rand(0..9)
  bathroom_for_guest = Faker::Boolean.boolean
  postalcode = Faker::Address.postcode
  prefecture = Faker::Address.state
  town = Faker::Pokemon.location
  street = Faker::Address.street_name
  building = Faker::OnePiece.character
  location_x = Faker::Address.latitude
  location_y = Faker::Address.longitude
  name = Faker::TheFreshPrinceOfBelAir.quote
  created_at = Faker::Time.between(DateTime.now - 1, DateTime.now)
  updated_at = Faker::Time.between(DateTime.now - 1, DateTime.now)

  Home.create(
    capacity:capacity,
    number_of_bedroom: number_of_bedroom,
    number_of_bathroom: number_of_bathroom,
    bathroom_for_guest: bathroom_for_guest,
    postalcode: postalcode,
    prefecture: prefecture,
    town: town,
    street: street,
    building: building,
    location_x: location_x,
    location_y: location_y,
    name:name,
    created_at: created_at,
    updated_at: updated_at
  )
 end

#ホームルール
# accept_kids = Faker::Boolean.boolean
# kids_reason = Faker::Hacker.say_something_smart
# accept_babies = Faker::Boolean.boolean
# babies_reason = Faker::Hacker.say_something_smart
# accept_pet = Faker::Boolean.boolean
# accept_smoking = Faker::Boolean.boolean
# accept_event_party = Faker::Boolean.boolean
# home_id = rand(1..100)
# created_at = Faker::Time.between(DateTime.now - 1, DateTime.now)
# updated_at = Faker::Time.between(DateTime.now - 1, DateTime.now)

# HomeRule.create(
# accept_kids: accept_kids,
# kids_reason: kids_reason,
# accept_babies: accept_babies,
# babies_reason: babies_reason,
# accept_pet: accept_pet,
# accept_smoking: accept_smoking,
# accept_event_party: accept_event_party,
# home_id: home_id,
# created_at: created_at,
# updated_at: updated_at
# )














