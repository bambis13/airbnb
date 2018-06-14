json.extract! home_review, :id, :review, :accuracy_rate, :location_rate, :communication_rate, :cleanliness_rate, :checkin_rate, :cost_performance_rate, :created_at, :updated_at
json.url home_review_url(home_review, format: :json)
