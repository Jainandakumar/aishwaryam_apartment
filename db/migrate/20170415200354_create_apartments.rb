class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :name
      t.string :owner
      t.string :builder
      t.text :address
      t.string :locality
      t.string :city
      t.integer :postcode
      t.string :state
      t.string :country
      t.integer :phone

      t.timestamps null: false
    end
  end
end
