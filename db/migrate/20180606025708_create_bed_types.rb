class CreateBedTypes < ActiveRecord::Migration[5.1]
  def change
    create_table    :bed_types do |t|
      t.integer     :single_bed
      t.integer     :double_bed
      t.integer     :queen_bed
      t.integer     :sofa_bed
      t.references  :home,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
