require 'faker'

avatar_urls = []

agent = Mechanize.new
page = agent.get('https://www.irasutoya.com/2015/10/blog-post_29.html') #いらすとや/いろいろな顔アイコン
elements = page.search(".entry a img")
elements.each do |ele|
  url = "https:" + ele.get_attribute('src')
  avatar_urls << url
end

p avatar_urls.count

country_c  = Country.count
currency_c = Currency.count
language_c = Language.count

avatar_urls.count.times do |i|
  user_name = Faker::Internet.user_name(4..8)

  p User.new(
    avatar:            avatar_urls[i],
    email:             Faker::Internet.free_email(user_name),
    password:          "airbnb",
    name:              user_name,
    birth_day:         Faker::Date.birthday(20, 60),
    sex:               rand(0..1),
    phone_number:      Faker::PhoneNumber.cell_phone,
    postal_code:       Faker::Address.postcode,
    prefecture:        Faker::Address.city,
    town:              Faker::Pokemon.location,
    street:            Faker::Address.street_address,
    building:          Faker::Address.building_number,
    self_introduction: Faker::Hacker.say_something_smart,
    country_id:        rand(1..country_c),
    currency_id:       rand(1..currency_c),
    language_id:       rand(1..language_c)
    ).save
end
