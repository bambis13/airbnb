class CreateHomeCategorySubs < ActiveRecord::Migration[5.1]
  def change
    create_table :home_category_subs do |t|
      t.string      :name,                null: false, index: true
    end
  end
end
