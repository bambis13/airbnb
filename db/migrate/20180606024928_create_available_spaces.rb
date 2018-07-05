class CreateAvailableSpaces < ActiveRecord::Migration[5.1]
  def change
    create_table :available_spaces do |t|
      t.text        :text
      t.boolean     :dedicated_living,     default: false
      t.boolean     :pool,                 default: false
      t.boolean     :kitchen,              default: false
      t.boolean     :washer_machine,       default: false
      t.boolean     :washer_dryer_machine, default: false
      t.boolean     :parking,              default: false
      t.boolean     :elevator,             default: false
      t.boolean     :jacuzzi,              default: false
      t.boolean     :gym,                  default: false
      t.references  :home,                 null: false, foreign_key: true
      t.timestamps
    end
  end
end
