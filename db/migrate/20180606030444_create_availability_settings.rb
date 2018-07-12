class CreateAvailabilitySettings < ActiveRecord::Migration[5.1]
  def change
    create_table      :availability_settings do |t|
      t.integer       :reservation_deadline       ,null: false
      t.time          :checkin_time_deadline_from 
      t.time          :checkin_time_deadline_to   
      t.integer       :acceptable_month_ahead     ,null: false
      t.integer       :max_accomodation_range     ,null: false
      t.integer       :min_accomodation_range     ,null: false
      t.references    :home                       ,null: false ,foreign_key: true, unique: true
      t.timestamps
    end
  end
end
