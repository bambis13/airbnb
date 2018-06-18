class RenameBathroomForGuestColumnToHomes < ActiveRecord::Migration[5.1]
  def change
    rename_column :homes, :bathroom_for_guest, :number_of_beds
  end
end
