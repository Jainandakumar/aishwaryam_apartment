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

	def new
		@flat = Flat.find(params[:flat_id])
		@residents = @flat.residents
		@floor = @flat.floor
		@block = @floor.block
		add_breadcrumb @block.apartment.name, apartment_path(@block.apartment)
		add_breadcrumb @block.name, block_path(@block)
		add_breadcrumb @floor.name, floor_path(@floor)
		add_breadcrumb @flat.name, flat_path(@flat)
		if params[:owner]
			add_breadcrumb 'Add owner', new_resident_path(flat_id: @flat.id, owner: true)
		else
			add_breadcrumb 'Add tenant', new_resident_path(flat_id: @flat.id)
		end
	end

end
