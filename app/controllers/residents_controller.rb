class ResidentsController < ApplicationController

	def flat_residents
		@flat = Flat.find(params[:flat_id])
		@floor = @flat.floor
		@block = @floor.block
		add_breadcrumb @block.apartment.name, apartment_path(@block.apartment)
		add_breadcrumb @block.name, block_path(@block)
		add_breadcrumb @floor.name, floor_path(@floor)
		add_breadcrumb @flat.name, flat_path(@flat)
		add_breadcrumb "#{@flat.name} residents", residents_flat_residents_path(flate_id: @flat.id)
	end

end
