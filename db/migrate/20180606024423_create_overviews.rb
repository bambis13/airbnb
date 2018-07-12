class CreateOverviews < ActiveRecord::Migration[5.1]
  def change
    create_table :overviews do |t|
      t.references      :home,                   null: false, foreign_key: true, unique: true
      t.text            :overview,               null: false
      t.text            :about_listing
      t.text            :areas_available
      t.text            :communication_frequency
      t.text            :other_notices
      t.text            :area_information
      t.text            :transportation
      t.timestamps
    end
  end
end
