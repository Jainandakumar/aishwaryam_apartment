module FlatsHelper
	def flat_status flat
		flat.status ? 'Owned' : 'Rented'
	end

	def flat_availability flat
		flat.status ? 'Vacant' : 'Occupied'
	end
end
