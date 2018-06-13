class AddColumnToHomes < ActiveRecord::Migration[5.1]
  def change
    add_reference :homes, :home_category_sub, foreign_key: true
  end
end
