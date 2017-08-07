class CreateWaterReadings < ActiveRecord::Migration
  def change
    create_table :water_readings do |t|
      t.float :meter_1
      t.float :meter_2
      t.float :meter_3
      t.integer :flat_id
      t.integer :month_id

      t.timestamps null: false
    end
  end
end
