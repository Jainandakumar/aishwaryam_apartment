class Flat < ActiveRecord::Base

	#status true ? 'owned' : 'rented'
	#availability true ? 'vacant' : 'occupied'

	belongs_to :floor
	has_many :flats_residents
	has_many :residents, through: :flats_residents
	has_many :water_readings

end
