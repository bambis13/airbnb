class CreateHomeCategoryMainSubs < ActiveRecord::Migration[5.1]
  def change
    create_table :home_category_main_subs do |t|
      t.references :home_category_sub
      t.references :home_category_main
    end
    add_index  :home_category_main_subs, [:home_category_sub_id, :home_category_main_id], unique: true, name: 'category_index'
  end
end
