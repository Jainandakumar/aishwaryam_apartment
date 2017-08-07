class AddColumnsToFlats < ActiveRecord::Migration
  def change
    add_column :flats, :status, :boolean, default: true
    add_column :flats, :availability, :boolean, default: true
    add_column :flats, :rent, :float, default: 0
  end
end
