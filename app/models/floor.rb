class Floor < ActiveRecord::Base

	belongs_to :block
	has_many :flats

	def get_flats_water_reading_for_month month_id
		flat_water_reading_hash = {}
		self.flats.sort.each do |flat|
			reading = flat.water_readings.find_by(month_id: month_id)
			flat_water_reading_hash[flat.id] = reading.present? ? [reading.meter_1, reading.meter_2, reading.meter_3] : [0, 0, 0]
		end
		return flat_water_reading_hash
	end

end
