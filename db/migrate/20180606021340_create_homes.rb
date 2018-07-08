class CreateHomes < ActiveRecord::Migration[5.1]
  def change
    create_table :homes do |t|
      t.integer       :capacity,            null: false
      t.integer       :number_of_bedroom ,  null: false
      t.integer       :number_of_bathroom,  null: false
      t.integer       :bathroom_for_guest,  null: false
      t.string        :postalcode,          null: false
      t.string        :prefecture,          null: false
      t.string        :town,                null: false, index: true
      t.string        :street,              null: false
      t.string        :building,            null: false
      t.float         :location_x,          null: false
      t.float         :location_y,          null: false
      t.string        :name,                null: false, index: true
      t.references    :home_category_sub,   foreign_key: true
      t.references    :country,             foreign_key: true
      t.references    :room_type,           foreign_key: true
      t.references    :currency,            foreign_key: true
      t.references    :user,                foreign_key: true
      t.timestamps
    end
  end
end
