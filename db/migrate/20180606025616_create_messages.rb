class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text       :text,     null: false
      t.integer    :receiver, null: false
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
