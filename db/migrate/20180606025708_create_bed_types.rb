class CreateBedTypes < ActiveRecord::Migration[5.1]
  def change
    create_table    :bed_types do |t|
      t.integer     :single_bed, null:false,  default: 0
      t.integer     :double_bed, null:false,  default: 0
      t.integer     :queen_bed,  null:false,  default: 0
      t.integer     :sofa_bed,   null:false,  default: 0
      t.references  :home,       null: false, foreign_key: true, unique: true
      t.timestamps
    end
  end
end
