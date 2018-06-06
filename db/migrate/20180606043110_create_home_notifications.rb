class CreateHomeNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table  :home_notifications do |t|
      t.boolean     :only_stairs,           default: false
      t.text        :stairs_detail
      t.boolean     :noisy,                 default: false
      t.text        :noisy_detail
      t.boolean     :pet_stayed,            default: false
      t.text        :pet_detail
      t.boolean     :no_parking,            default: false
      t.text        :parking_guide
      t.boolean     :shared_space,          default: false
      t.text        :shared_space_detail
      t.boolean     :limited_amenity,       default: false
      t.text        :limited_amenity_detail
      t.boolean     :surveillance_camera,   default: false
      t.text        :camera_detail
      t.boolean     :firearm,               default: false
      t.text        :firearm_detail
      t.boolean     :dangerous_animal,      default: false
      t.text        :animal_detail
      t.references  :home,                  null: false, foreign_key: true
      t.timestamps
    end
  end
end
