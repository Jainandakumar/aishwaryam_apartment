class WaterReading < ActiveRecord::Base

	belongs_to :flat
	belongs_to :month
end
