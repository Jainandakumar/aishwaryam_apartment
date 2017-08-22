class Flat < ActiveRecord::Base

	#status true ? 'owned' : 'rented'
	#availability true ? 'vacant' : 'occupied'

	belongs_to :floor
	has_many :flats_residents
	has_many :residents, through: :flats_residents
	has_many :water_readings

	def current_year_water_readings
		self.water_readings.where('extract(year from created_at) = ?', Time.now.year)
	end

	def owner
		return self.flats_residents.present? ? self.flats_residents.find_by(owner: true, family_head: true).present? ? self.flats_residents.find_by(owner: true, family_head: true) : false : false
	end

end
