class CreateAvailabilitySettings < ActiveRecord::Migration[5.1]
  def change
    create_table      :availability_settings do |t|
      t.integer       :reservation_deadline
      t.time          :checkin_time_deadline_from
      t.time          :checkin_time_deadline_to
      t.integer       :acceptable_month_ahead
      t.integer       :max_accomodation_range
      t.integer       :min_accomodation_range
      t.references    :home                       ,null: false ,foreign_key: true, unique: true
      t.timestamps
    end
  end
end
