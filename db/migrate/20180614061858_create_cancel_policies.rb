class CreateCancelPolicies < ActiveRecord::Migration[5.1]
  def change
    create_table :cancel_policies do |t|
      t.integer    :strict_level, null: false
      t.text       :text
      t.references :home,         foreign_key: true, unique: true
      t.timestamps
    end
  end
end
