json.extract! home_reservation, :id, :checkin_date, :checkout_date, :number_of_guests, :created_at, :updated_at
json.url home_reservation_url(home_reservation, format: :json)
