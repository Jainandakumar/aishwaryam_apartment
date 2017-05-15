class Floor < ActiveRecord::Base

	belongs_to :block

	has_many :flats

end
