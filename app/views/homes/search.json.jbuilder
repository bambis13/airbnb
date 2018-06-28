json.array! @homes do |home|
  json.name           home.name
  json.prefecture     home.prefecture
  json.country        home.country.name
end
