class Flat < ActiveRecord::Base

	belongs_to :floor

	has_many :flats_residents

	has_many :residents, through: :flats_residents

end
