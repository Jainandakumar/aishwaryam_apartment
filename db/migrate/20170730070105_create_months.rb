class CreateMonths < ActiveRecord::Migration
  def self.up
    create_table :months do |t|
      t.string :name

      t.timestamps null: false
    end

    ['January', 'Feburary', 'March', 'April', 'May', 'June', 'July', 'August', 'Septemeber', 'October', 'November', 'December'].each do |month_name|
    	Month.create(name: month_name)
    end
  end

  def self.down
  	drop_table :months
  end

end
