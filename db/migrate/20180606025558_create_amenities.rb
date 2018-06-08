class CreateAmenities < ActiveRecord::Migration[5.1]
  def change
    create_table :amenities do |t|
      t.boolean    :necessities, default: false
      t.boolean    :wifi, default: false
      t.boolean    :shampoo, default: false
      t.boolean    :closet, default: false
      t.boolean    :tv_set, default: false
      t.boolean    :heating, default: false
      t.boolean    :air_conditioner, default: false
      t.boolean    :breakfast, default: false
      t.boolean    :desk, default: false
      t.boolean    :fireplace, default: false
      t.boolean    :iron, default: false
      t.boolean    :hair_dryer, default: false
      t.boolean    :allowed_pet, default: false
      t.boolean    :smoke_detector, default: false
      t.boolean    :carbon_monoxide_detecter, default: false
      t.boolean    :aid_set, default: false
      t.boolean    :fire_extinguisher, default: false
      t.boolean    :disaster_card, default: false
      t.boolean    :keyed_door, default: false
      t.references :home, null: false, foreign_key: true
      t.timestamps
    end
  end
end
