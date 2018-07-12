class CreateHomeCategoryMains < ActiveRecord::Migration[5.1]
  def change
    create_table :home_category_mains do |t|
      t.string :name,  null: false, index: true, unique: true
    end
  end
end
