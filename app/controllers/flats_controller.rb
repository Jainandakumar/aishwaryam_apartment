class FlatsController < ApplicationController

	def new
		@row = 1
		@floor = Floor.find(params[:floor_id])
		@block = @floor.block
		add_breadcrumb @block.apartment.name, apartment_path(@block.apartment)
		add_breadcrumb @block.name, block_path(@block)
		add_breadcrumb @floor.name, floor_path(@floor)
		add_breadcrumb "Add flat", new_flat_path(floor_id: @floor.id)
		@flat = @floor.flats.new
		if request.xhr?
			@row = params[:row].to_i + 1
			render partial: "new_flat"
		end
	end

	def create_flat
		floor = Floor.find(params[:floor_id])
		params[:flat].each do |row, value|
			flat = floor.flats.create(name: value["name"], bed_room: value["bed_room"], sq_ft: value["sq_ft"])
		end
		redirect_to floor_path(floor)
		flash[:notice] = "Flat(s) created successfully!"
	end

	def edit
		@flat = Flat.find(params[:id])
	end

	def update
		params.permit!
		@flat = Flat.find(params[:id])
		floor = @flat.floor
		@flat.update(params[:flat])
		redirect_to floor_path(floor)
		flash[:notice] = "Flat updated successfully!"
	end

	def show
		@flat = Flat.find(params[:id])
		@residents = @flat.residents
	end

	def destroy
		@flat = Flat.find(params[:id])
		floor = @flat.floor
		@flat.destroy
		redirect_to floor_path(floor)
		flash[:notice] = "Flat deleted successfully!"
	end

end
