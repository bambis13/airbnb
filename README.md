# Airbnb

Database_Design
> Ruby on Rails - _5.1.6_
> mysql2 - _0.3.18_
___


### ______________________________________ User関連 ______________________________________

### User
#### association
```
has_many :messages, :favorite_lists,:listing_photos, :home_reservations, :home_reviews
```
```
belongs_to :country, :language, :currency
```
#### Users_table
|Column|Type|Options|
-|-|-
name|string|null: false, index: true
avatar|text|null: false
birth_day|date|null: false
sex|enum|null: false
phone_number|string|null: false, unique: true
postal_code|string|null: false
prefecture|string|null: false
town|string|null: false
street|string|null: false
building|string|null: false
self_introduction|text|null: false
status|enum|null: false
superhost|enum|default: 0
created_at|timestamps|null: false |
updated_at|timestamps|null: false |
country_id|references|null: false, foreign_key: true, index: true
currency_id|references|null: false, foreign_key: true, index: true
language_id|references|null: false, foreign_key: true, index: true


### ______________________________________ Home関連 ______________________________________

### Home
#### association
```
has_many :favorites, :home_reservations, :home_reviews, :additional_home_rules, :listing_photo_homes
```
```
belongs_to :home_category_sub, :room_type, :country, :currency
```
```
has_one :amenity, :bed_type, :available_spaces, :overview, :available_setting, :price, :home_rule, :additional_home_rule, :home_notification
```
#### Homes_table
|Column|Type|Options|
-|-|-
capacity|integer|null: false
number_of_bedrooms|integer|null: false
number_of_bathrooms|integer|null: false
number_of_beds|integer|null: false
postal_code|string|null: false
prefecture|string|null: false
town|string|null: false, index: true
street|string|null: false
building|string|null: false
location_x|integer|null: false
location_y|integer|null: false
name|string|null: false, index: true
created_at|timestamps|null: false |
updated_at|timestamps|null: false |
country_id|references|null: false, foreign_key: true, index: true
home_category_sub_id|references|null: false, foreign_key: true, index: true
room_type_id|references|null: false, foreign_key: true, index: true
currency_id|references|null: false, foreign_key: true, index: true
user_id|references|null: false, foreign_key: true, index: true
___

### Listing_photo
#### association
```
belongs_to :user, :home
```
#### Listing_photos_table
|Column|Type|Options|
-|-|-
image|text|null: false|
status|enum|null: false|
created_at|timestamps|null: false |
updated_at|timestamps|null: false |
home_id|references|null: false, foreign_key: true
___


### Bed_type
#### association
```
belongs_to :home
```
#### Bed_types_table
|Column|Type|Options|
-|-|-
single_bed|integer||
double_bed|integer||
queen_bed|integer||
sofa_bed|integer||
home_id|references|null: false, foreign_key: true, unique: true|
___

### Amenity
#### association
```
belongs_to :home
```
#### Amenities_table
|Column|Type|Options|
-|-|-
necessities|boolean| |
wifi|boolean| |
shampoo|boolean| |
closet|boolean| |
tv_set|boolean| |
heating|boolean| |
air_conditioner|boolean| |
breakfast|boolean| |
desk|boolean| |
fireplace|boolean| |
iron|boolean| |
hair_dryer|boolean| |
allowed_pet|boolean| |
smoke_detector|boolean| |
carbon_monoxide_detecter|boolean| |
aid_set|boolean| |
fire_extinguisher|boolean| |
disaster_card|boolean| |
keyed_door|boolean| |
home_id|references|null:false, foreign_key: true, unique: true|
___

### Available_space
#### association
```
belongs_to :home
```
#### Available_spaces_table
|Column|Type|Options|
-|-|-
dedicated_living|boolean| |
pool|boolean| |
kitchen|boolean| |
washer_machine|boolean| |
washer_dryer_machine|boolean| |
parking|boolean| |
elevator|boolean| |
jacuzzi|boolean| |
gym|boolean| |
home_id|references|null:false, foreign_key: true, unique: true|
___

### Availability_setting
#### association
```
belongs_to :home
```
#### Availability_settings_table
|Column|Type|Options|
-|-|-
reservation_deadline|integer| |
checkin_time_deadline_from|time| |
checkin_time_deadline_to|time| |
acceptable_month_ahead|integer| |
muximum_accomodation_range|integer| |
minimum_accomodation_range|integer| |
home_id|references|null:false, foreign_key: true, unique: true|
___


### Price
#### association
```
belongs_to :home
```
#### Prices_table
|Column|Type|Options|
-|-|-
pricing_method|enum|null: false|
default_price|integer|null: false|
muximum_price|integer| |
minimum_price|integer| |
first_arrival_discount|boolean||
weekly_discount_rate|float|null: false|
monthly_discount_rate|float|null: false|
cleaning_fee|integer|null: false
deposit|integer|null: false
additional_fee_per_person|integer|null: false
home_id|references|null:false, foreign_key: true, unique: true|
___


### Home_rule
#### association
```
belongs_to :home
```
#### Home_rules_table
|Column|Type|Options|
-|-|-
accept_kids|boolean| |
kids_reason|text| |
accept_babies|boolean| |
babies_reason|text| |
accept_pet|boolean| |
accept_smoking|boolean| |
accept_event_party|boolean| |
home_id|references|null: false, foreign_key: true, unique: true|
___


### Additional_home_rule
#### association
```
belongs_to :home
```
#### Additional_home_rules_table
|Column|Type|Options|
-|-|-
content|text|null: false|
home_id|references|null: false, foreign_key: true|
___


### Home_notification
#### association
```
belongs_to :home
```
#### Home_notifications_table
|Column|Type|Options|
-|-|-
only_stairs|boolean| |
stairs_detail|text| |
noisy|boolean| |
noisy_detail|text| |
pet_stayed|boolean| |
pet_detail|text| |
no_parking|boolean| |
parking_guide|text| |
shared_space|boolean| |
shared_space_detail|text| |
limited_amenity|boolean| |
limited_amenity_detail|text| |
surveillance_camera|boolean| |
camera_detail|text| |
firearm|boolean| |
firearm_detail|text| |
dangerous_animals|boolean| |
animals_detail|text| |
home_id|references|null: false, foreign_key: true, unique: true|
___


### Overview
#### association
```
belongs_to :home
```
#### Overviews_table
|Column|Type|Options|
-|-|-
overview|text|null: false
about_listing|text| |
areas_available|text| |
communication_frequency|text| |
other_notices|text| |
area_information|text|  |
transportation|text|  |
home_id|references|null: false, foreign_key: true, unique: true


### ______________________________________ 機能 ______________________________________

### Home_reservation
#### association
```
has_one :home_review
```
```
belongs_to :user, :home
```
#### Home_reservations_table
|Column|Type|Options|
-|-|-
checkin_date|date|null: false |
checkout_date|date|null: false |
number_of_adults|integer|null: false |
number_of_children|integer|null: false |
number_of_babies|integer|null: false |
per_day_fee|integer|null: false |
total_fee|integer|null: false |
cleaning_fee|integer|null: false |
service_fee|integer|null: false |
created_at|timestamps|null: false |
updated_at|timestamps|null: false |
user_id|references|null: false, foreign_key: true
home_id|references|null: false, foreign_key: true

[ checkin_date, checkout_date, home_id ], unique: true



### ______________________________________ Settings ______________________________________

### Home_category_main
#### association
```
has_and_belongs_to_many :home_category_subs
```
#### Home_category_mains_table
|Column|Type|Options|
-|-|-
name|string|null: false |
___

### Home_category_sub
#### association
```
has_many :home
```
```
has_and_belongs_to_many :home_category_mains
```
#### Home_category_subs_table
|Column|Type|Options|
-|-|-
name|string|null: false |
___

### Home_category_main_sub
#### association
```
none
```
#### Home_category_main_subs_table
|Column|Type|Options|
-|-|-
home_category_main_id|references|null: false, foreign_key: true
home_category_sub_id|references|null: false, foreign_key: true
___
[ home_category_sub_id, home_category_main_id ], unique: true


### Country
#### association
```
has_many :homes, :users
```
#### Countries_table
|Column|Type|Options|
-|-|-
name|string|null: false|
___


### Language
#### association
```
has_many :users
```
#### Languages_table
|Column|Type|Options|
-|-|-
name|string|null: false |
___


### Currency
#### association
```
has_many :users, :homes
```
#### Currencies_table
|Column|Type|Options|
-|-|-
name|string|null: false |
___

### Room_type
#### association
```
has_many :homes
```
#### Room_types_table
|Column|Type|Options|
-|-|-
name|string|null: false|
___


<!-- *-------------------- 未実装 --------------------*

### Home_review
#### association
```
belongs_to :home, :user, :home_reservation
```
#### Home_reviews_table
|Column|Type|Options|
-|-|-
review|text|null: false|
accuracy_rate|integer|null: false|
location_rate|integer|null: false|
communication_rate|integer|null: false|
cleanliness_rate|integer|null: false|
checkin_rate|integer|null: false|
cost_performance_rate|integer|null: false|
created_at|timestamps|null: false |
updated_at|timestamps|null: false |
user_id|references|null: false
home_id|references|null: false, foreign_key: true
home_reservation_id|references|null: false
___


### Favorite_list
#### association
```
has_many :favorites
```
```
belongs_to :user
```
#### Favorite_lists_table
|Column|Type|Options|
-|-|-
user_id|references|null: false, foreign_key: true
name|string| |
___


### Messege
#### association
```
belongs_to :user
```
#### Messages_table
|Column|Type|　Options|
-|-|-
sender_user_id|references|null: false, foreign_key: true
recipient_user_id|references|null: false, foreign_key: true
text|text| |
created_at|timestamps| |
___ -->
