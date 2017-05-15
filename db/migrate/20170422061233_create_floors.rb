class CreateFloors < ActiveRecord::Migration
  def change
    create_table :floors do |t|
      t.string :name
      t.integer :block_id

      t.timestamps null: false
    end
  end
end
