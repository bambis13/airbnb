class CreateAdditionalHomeRules < ActiveRecord::Migration[5.1]
  def change
    create_table :additional_home_rules do |t|
      t.text       :content, null: false
      t.references :home,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
