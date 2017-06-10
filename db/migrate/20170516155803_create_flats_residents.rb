class CreateFlatsResidents < ActiveRecord::Migration
  def change
    create_table :flats_residents do |t|
      t.integer :resident_id
      t.integer :flat_id
      t.boolean :active
      t.date :from
      t.date :to
      t.string :resident_type

      t.timestamps null: false
    end
  end
end