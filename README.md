Airbnb Database_Design
> Ruby on Rails - _5.1.6_
> mysql2 - _0.3.18_
___

### User
#### association
```
has_many :messages, :favorite_lists,:listing_photos, :home_reservations, :home_reviews
```
```
belongs_to :country, :language, :currency
```
#### table
|Column|Type|Options|
-|-|-
name|string|null: false, index: true
birth_day|date|null: false
sex|enum|null: false
phone_number|integer|null: false, unique: true
postal_code|integer|null: false
country|references|null: false, foreign_key: true
prefecture|string|null: false
town|string|null: false
street|string|null: false
building|string|null: false
self_introduction|text|null: false
currency|references|null: false,foreign_key: true
language|references|null: false, foreign_key: true
___

### Home
#### association
```
has_many :favorites, :home_reservations, :home_reviews, :additional_home_rules
```
```
belongs_to :home_category_sub, :room_type, :country, :currency
```
```
has_one :amenity, :bed_type, :available_space, :overview, :available_setting, :price, :home_rule
```
```
has_and_belongs_to_meny :listing_photos
```
#### table
|Column|Type|Options|
-|-|-
capacity|integer|null: false
number_of_bedrooms|integer|null: false
number_of_bathrooms|integer|null: false
bathroom_for_guest|boolean|null: false
postal_code|integer|null: false
country|references|null: false, foreign_key: true, index: true
prefecture|string|null: false
town|string|null: false, index: true
street|string|null: false
building|string|null: false
location_x|integer|null: false
location_y|integer|null: false
amenity|references|null: false, foreign_key: true
available_space|references|null: false, foreign_key: true
overview|references|null: false, foreign_key: true
name|string|null: false, index: true
home_category_sub|references|null: false
room_type|references|null: false
bed_type|references|null: false
invite_frequency|enum|null: false
availability_setting|references|null: false, foreign_key: true
home_rule|references|null: false, foreign_key: true
additional_home_rule|references|null: false, foreign_key: true
home_notification|references|null: false, foreign_key: true
price|references|null: false, foreign_key: true
___

### Home_reservation
#### association
```
has_one :home_review
```
```
belongs_to :user, :home
```
#### table
|Column|Type|Options|
-|-|-
user|references|null: false, foreign_key: true
checkin_date|datetime|null: false |
checkout_date|datetime|null: false |
number_of_guests|integer|null: false |
created_at|timestamps| |
___

### Home_review
#### association
```
belongs_to :home, :user, :home_reservation
```
#### table
|Column|Type|Options|
-|-|-
user|references|null: false
home|references|null: false, foreign_key: true
home_reservation|references|null: false
review|text|null: false|
accuracy_rate|integer|null: false|
location_rate|integer|null: false|
communication_rate|integer|null: false|
cleanliness_rate|integer|null: false|
checkin_rate|integer|null: false|
cost_performance_rate|integer|null: false|
home_reservation|references|null: false, foreign_key: true|


### Listing_photo
#### association
```
belongs_to :user
```
```
has_and_belongs_to_many :homes
```
#### table
|Column|Type|Options|
-|-|-
user|references|null: false, foreign_key: true
image|text|null: false|

___

### Room_type
#### association
```
has_many :homes
```
#### table
|Column|Type|Options|
-|-|-
name|string|null: false|
___

### Bed_type
#### association
```
belongs_to :home
```
#### table
|Column|Type|Options|
-|-|-
single_bed|integer||
double_bed|integer||
queen_bed|integer||
sofa_bed|integer||
home|references|null: false, foreign_key: true|
___

### Country
#### association
```
has_many :homes, :users
```
#### table
|Column|Type|Options|
-|-|-
name|string|null: false|
___

### Amenity
#### association
```
belongs_to :home
```
#### table
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
home|references|null:false, foreign_key: true|
___

### Available_space
#### association
```
belongs_to :home
```
#### table
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
home|references|null:false, foreign_key: true|
___

### Availability_setting
#### association
```
belongs_to :home
```
#### table
|Column|Type|Options|
-|-|-
reservation_deadline|integer| |
checkin_time_deadline_from|time| |
checkin_time_deadline_to|time| |
acceptable_month_ahead|integer| |
muximum_accomodation_range|integer| |
minimum_accomodation_range|integer| |
home|references|null:false, foreign_key: true|
___


### Price
#### association
```
belongs_to :home
```
#### table
|Column|Type|Options|
-|-|-
pricing_method|enum|null: false|
default_price|integer|null: false|
muximum_price|integer| |
minimum_price|integer| |
first_arrival_discount|boolean||
weekly_discount_rate|float|null: false|
monthly_discount_rate|float|null: false|
home|references|null:false, foreign_key: true|
___

### Home_rule
#### association
```
belongs_to :home
```
#### table
|Column|Type|Options|
-|-|-
accept_kids|boolean| |
kids_reason|text| |
accept_babies|boolean| |
babies_reason|text| |
accept_pets|boolean| |
accept_smoking|boolean| |
accept_event_party|boolean| |
home|references|null: false, foreign_key: true|
___

### Additional_home_rule
#### association
```
belongs_to :home
```
#### table
|Column|Type|Options|
-|-|-
content|text|null: false|
home|references|null: false, foreign_key: true|
___

### home_notification
#### association
```
belongs_to :home
```
#### table
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
home|references|null: false, foreign_key: true|
___


### Home_category_main
#### association
```
has_and_belongs_to_many :home_category_subs
```
#### table
|Column|Type|Options|
-|-|-
name|string| |
___

### Home_category_sub
#### association
```
has_many :home
```
```
has_and_belongs_to_many :home_category_mains
```
#### table
|Column|Type|Options|
-|-|-
name|string| |
___

### Favorite_list
#### association
```
has_many :favorites
```
```
belongs_to :user
```
#### table
|Column|Type|Options|
-|-|-
user|references|null: false, foreign_key: true
name|string| |
___

### Messege
#### association
```
belongs_to :user
```
#### table
|Column|Type|　Options|
-|-|-
user|references|null: false, foreign_key: true
sender|references|null: false, foreign_key: true
recipient|references|null: false, foreign_key: true
text|text| |
created_at|timestamps| |

___

### Overview
#### association
```
belongs_to ::home
```
#### table
|Column|Type|Options|
-|-|-
home|references|null: false, foreign_key: true
overview|text|null: false
about_listing|text| |
areas_available|text| |
communication_frequency|text| |
other_notices|text| |
area_information|text|  |
transportation|text|  |

___

### Language
#### association
```
has_many :users
```
#### table
|Column|Type|Options|
-|-|-
name|string| |
___

### Currency
#### association
```
has_many :users, :homes
```
#### table
|Column|Type|Options|
-|-|-
name|string| |
___

### Listing_photo_home
#### table
|Column|Type|Options|
-|-|-
home|references|null: false, foreign_key: true
listing_photo|references|null: false, foreign_key: true

___

### Home_category_main_ sub

#### table
|Column|Type|Options|
-|-|-
home_category_main|null: false, foreign_key: true| |
home_category_sub|null: false, foreign_key: true| |
___


