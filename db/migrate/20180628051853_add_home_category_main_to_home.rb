class AddHomeCategoryMainToHome < ActiveRecord::Migration[5.1]
  def change
    add_reference :homes, :home_category_main, foreign_key: true
  end
end
