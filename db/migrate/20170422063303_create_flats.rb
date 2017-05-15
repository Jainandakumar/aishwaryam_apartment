class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.string :name
      t.integer :floor_id
      t.integer :bed_room
      t.float :sq_ft

      t.timestamps null: false
    end
  end
end
