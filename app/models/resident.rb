class Resident < ActiveRecord::Base

	has_many :flats_residents

	has_many :flats, through: :flats_residents

end
