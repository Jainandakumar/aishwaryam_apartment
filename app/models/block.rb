class Block < ActiveRecord::Base

	belongs_to :apartment

	has_many :floors

end
