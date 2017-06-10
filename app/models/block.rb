class Block < ActiveRecord::Base

	belongs_to :apartment

	has_many :floors

	def no_of_flats
		self.floors.includes(:flats).map{|f| f.flats.count}.sum
	end

end
