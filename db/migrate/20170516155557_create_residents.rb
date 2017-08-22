class CreateResidents < ActiveRecord::Migration
  def change
    create_table :residents do |t|
      t.string :name
      t.integer :age
      t.string :sex
      t.integer :phone
      t.string :email
      t.boolean :pet

      t.timestamps null: false
    end
  end
end
