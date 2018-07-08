class CreateHomeCategoryMainSubs < ActiveRecord::Migration[5.1]
  def change
    create_table :home_category_main_subs do |t|
      t.references :home_category_sub
      t.references :home_category_main
      t.timestamps
    end
  end
end
