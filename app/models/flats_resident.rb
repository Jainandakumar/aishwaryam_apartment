class FlatsResident < ActiveRecord::Base

	belongs_to :flat

	belongs_to :resident

end
