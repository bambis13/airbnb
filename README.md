Airbnb Database_Design
> Ruby on Rails - _5.1.6_
> mysql2 - _0.3.18_
___
### User
#### association
```
has_many :messeges, :favolists, :experience_reservations, :experience_reviews, :listing_photos, :listing_reservations, :linting_reviews
```
```
has_one :language, :currency
```
#### table
|Colum|Type|Options|
-|-|-
name|string|null: false, index: true
birth_day|date|null: false
sex|enum|null: false
phone_number|integer|null: false, unique: true
address|string|null: false
self_introduction|text|null: false
currency|references|null: false, index: true, foreign_key: true
language|references|null: false, index: true, foreign_key: true
___
### Listing
#### association
```
has_many :available_spaces, :prices, :favorite, :listing_reservations, :listing_reviews
```
```
belongs_to :listing_smallCategory :room_type
```
```
has_one :country_name, :amenity, :bed_type, :available_space, :additional_overview, :available_setting, :price, :house_rule
```
```
has_and_belongs_to_meny :listing_photos
```
#### table
|Colum|Type|Options|
-|-|-
capacity|integer|null: false
number_of_bedrooms|integer|null: false
number_of_bathrooms|integer|null: false
bathroom_for_guest|boolean|null: false
postal_code|string|null: false
country|references|null: false, foreign_key: true
prefecture|string|null: false
town|string|null: false
street|string|null: false
building|string|null: false
map_location|integer|null: false
amenity|references|null: false, foreign_key: true
available-space|references|null: false, foreign_key: true
overview|text|null: false
additional_overviews|references|null: false, foreign_key: true
name|string|null: false
categorysmall|references|null: false
roomtype|references|null: false
bed_nums|references|null: false
having_hosted_before|boolean|null: false
frequency|references|null: false, foreign_key: true
reservation_deadline|integer|null: false
availability_setting|references|null: false, foreign_key: true
calendar|string|null: false
house_rule|references|null: false, foreign_key: true
price|references|null: false, foreign_key: true
___
### Listing_reservation
#### association
```
belongs_to :user, :listing_review, :listing
```
#### table
|Colum|Type|Options|
-|-|-
user|references|null: false, foreign_key: true
checking_date|datetime| |
checkout_date|datetime| |
guests_nunber|integer| |
created_at|timestamps| |
___
### Listing_revirw
#### association
```
has_many :listing_reservations
```
```
belongs_to :listing, :user
```
#### table
|Colum|Type|Options|
-|-|-
user|references|null: false, foreign_key: true
listing|references|null: false, foreign_key: true
listing_reservation|references|null: false, foreign_key: true
review|integer| |
accuracy_rate|integer| |
location_rate|integer| |
communication_rate|integer| |
cleanliness_rate|integer| |
check_in_rate|integer| |
cost_paformance_rate|integer| |
___
### Listing_photo
#### association
```
belongs_to :user
```
```
has_and_belongs_to_meny :listings, :experiences
```
#### table
|Colum|Type|Options|
-|-|-
user|references|null: false, foreign_key: true
image|text| |
___
### Room_type
#### association
```
has_many :listing
```
#### table
|Colum|Type|Options|
-|-|-
name|string| |
___
### Bed_type
#### association
```
belongs_to :listing
```
#### table
|Colum|Type|Options|
-|-|-
single_bed|integer| |
double_bed|integer| |
queen_bed|integer| |
sofa_bed|integer| |
___
### Country_name
#### association
```
belongs_to :listing
```
#### table
|Colum|Type|Options|
-|-|-
name|string| |
___
### Amenity
#### association
```
belongs_to :listing
```
#### table
|Colum|Type|Options|
-|-|-
nocessities|boolean| |
wifi|boolean| |
shampoo|boolean| |
closet|boolean| |
tv_set|boolean| |
heating|boolean| |
air_condition|boolean| |
breakfast|boolean| |
desk|boolean| |
fireplace|boolean| |
iron|boolean| |
hairdryer|boolean| |
allowed_pet|boolean| |
smoke_detector|boolean| |
carbon_monoxide_detecter|boolean| |
aid_set|boolean| |
digestive_organ|boolean| |
disaster_card|boolean| |
keyed_door|boolean| |
___
### Amenity_space
#### association
```
belongs_to :listing
```
#### table
|Colum|Type|Options|
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
___
### Availability_setting
#### association
```
belongs_to :listing
```
#### table
|Colum|Type|Options|
-|-|-
booking_due|integer| |
booking_due_time|integer| |
checkin_time_due_from|integer| |
checkin_time_due_to|integer| |
available_booking_date|integer| |
muximum_accomodation_range|integer| |
minimum_accomodation_range|integer| |

___
### Price
#### association
```
belongs_to :listing, :experience
```
#### table
|Colum|Type|Options|
-|-|-
price|integer| |
muximum_price|integer| |
minimum_price|integer| |
fixied_pricing|integer| |
smart_pricing|integer| |
weekly_discount|integer| |
discount|integer| |
___
### House_rule
#### association
```
belongs_to :listing
```
#### table
|Colum|Type|Options|
-|-|-
kids|boolean| |
kids_reason|text| |
babies|boolean| |
babies_reason|text| |
pet|boolean| |
somoking|boolean| |
event_party|boolean| |
additional_rule|boolean| |
rule_add|text| |
not_barrierfree|boolean| |
barrierfree_reason|text| |
noisy|boolean| |
noisy_reason|text| |
pet_stayed|boolean| |
pet_reason|text| |
parking|boolean| |
parking_reason|text| |
shared_space|boolean| |
space_reason|text| |
limited_amenity|boolean| |
amenity_reason|text| |
surveillance_camera|boolean| |
camera_reason|text| |
firearm|boolean| |
firearm_reason|text| |
dangerous_animals|boolean| |
animals_reason|text| |
___
### Listing_big_category
#### association
```
has_and_belongs_to_meny :listing_smallCategries
```
#### table
|Colum|Type|Options|
-|-|-
name|stirng| |
___
### Listing_smallCategory
#### association
```
has_meny :listing
```
```
has_and_belongs_to_meny :listing_bigCategries
```
#### table
|Colum|Type|Options|
-|-|-
name|string| |
___
### Experience
#### association
```
has_many :experience_reservation, :experience_review, favolist
```
```
belongs_to :experience_categry
```
```
has_and_belongs_to_meny :listing_photos
```
#### table
|Colum|Type|Options|
-|-|-
title|string|null: false, index: true
location|integer|null: false, index: true
total_time|string|null: false
facility|string|null: false
guidance_language|string|null: false
world_surf_certification|text|null: false
about_host|text| |
what_to_experience|text| |
prepared_stuff|text| |
entrance_range|text| |
route|text| |
meeting_place|string|null: false
maximum_participants|text| |
conditions_of_participation|text| |
cancel_policy|text|null: false
category|references|null: false, index: true, foreign_key: true
___
### Experience_categry
#### association
```
has_many :experiences
```
#### table
|Colum|Type|Options|
-|-|-
experience|references|null: false, foreign_key: true
name|string| |
___
### Experience_reservation
#### association
```
has_many :experience_reviews
```
```
belongs_to :experience, :user
```
#### table
|Colum|Type|Options|
-|-|-
user|references|null: false, foreign_key: true
experience|references|null: false, foreign_key: true
experience_date|datetime| |
created_at|timestamps| |

___
### Experience_review
#### association
```
belongs_to :experience, :experience_reservation, :user
```
#### table
|Colum|Type|Options|
-|-|-
user|references|null: false, foreign_key: true
experience|references|null: false, foreign_key: true
experience_reservation|references|null: false, foreign_key: true
review|text| |
rate|integer| |
___
### Favorite
#### association
```
belongs_to :favolist, :listing, :experience
```
#### table
|Colum|Type|Options|
-|-|-
listing|references|null: false, foreign_key: true
experience|references|null: false, foreign_key: true
favolist|references|null: false, foreign_key: true
___
### Favolist
#### association
```
has_many :favorite
```
```
belongs_to :user
```
#### table
|Colum|Type|Options|
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
|Colum|Type|Options|
-|-|-
user|references|null: false, foreign_key: true
sender|references|null: false, foreign_key: true
receiver|references|null: false, foreign_key: true
text|text| |
created_at|timestamps| |

___
### Additional_overview
#### association
```
belongs_to :listing
```
#### table
|Colum|Type|Options|
-|-|-
listing|references|null: false, foreign_key: true
about_listing|text| |
areas_available|text| |
frequency|text| |
other_notices|text| |
area_information|text|  |
transportation|text|  |
___
### Language
#### association
```
belongs_to :user
```
#### table
|Colum|Type|Options|
-|-|-
name|string| |
___
### Currency
#### association
```
belongs_to :user
```
#### table
|Colum|Type|Options|
-|-|-
name|string| |
___
### Listing_photo_listing
#### table
|Colum|Type|Options|
-|-|-
listing|references|null: false, foreign_key: true
listing_photo|references|null: false, foreign_key: true
___
### Listing_photo_experience
#### table
|Colum|Type|Options|
-|-|-
experience|references|null: false, foreign_key: true
listing_photo|references|null: false, foreign_key: true
___
### Listing_big_small_categry
#### table
|Colum|Type|Options|
-|-|-
listing_big_category_id|null: false, foreign_key: true| |
listing_small_category_id|null: false, foreign_key: true| |
___
