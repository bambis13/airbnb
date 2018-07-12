class CreateHomeRules < ActiveRecord::Migration[5.1]
  def change
    create_table :home_rules do |t|
      t.boolean     :accept_kids,        default: false
      t.text        :kids_reason
      t.boolean     :accept_babies,      default: false
      t.text        :babies_reason
      t.boolean     :accept_pet,         default: false
      t.boolean     :accept_smoking,     default: false
      t.boolean     :accept_event_party, default: false
      t.references  :home,                null: false, foreign_key: true, unique: true
      t.timestamps
    end
  end
end
