class Apartment < ActiveRecord::Base

	validates :name, presence: true

	has_many :blocks

	def no_of_flats
		self.blocks.includes(:floors).map{|b| b.floors.includes(:flats).map{|f| f.flats.count}}.flatten.sum
	end
	
end
