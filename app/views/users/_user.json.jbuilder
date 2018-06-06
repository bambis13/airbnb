json.extract! user, :id, :name, :birth_day, :sex, :phone_number, :postal_code, :prefeture, :town, :street, :building, :self_introduction, :created_at, :updated_at
json.url user_url(user, format: :json)
