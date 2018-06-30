class ChangeDataTypeToHomes < ActiveRecord::Migration[5.1]
  def up
    change_table :homes do |t|
      t.change :number_of_beds, :integer
    end
  end

  def down
    change_table :homes do |t|
      t.change :number_of_beds, :boolean
    end
  end
end
