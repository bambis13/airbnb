class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|

      t.timestamps
    end
  end
end

# 進捗次第で追加するもの
# user_id|references|null: false, foreign_key: true
# home_id|references|null: false, foreign_key: true
