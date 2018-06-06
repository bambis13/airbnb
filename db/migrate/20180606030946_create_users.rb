class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, index: true
      t.date :birth_day, null: false
      t.integer :sex, null: false
      t.string :phone_number, null: false, unique:true
      t.string :postal_code, null: false
      t.string :prefeture, null: false
      t.string :town, null: false
      t.string :street, null: false
      t.string :building, null: false
      t.text :self_introduction, null: false
      t.timestamps
    end
  end
end

# 進捗次第で追加するもの
# country_id|references|null: false, foreign_key: true
# currency_id|references|null: false,foreign_key: true
# language_id|references|null: false, foreign_key: true
