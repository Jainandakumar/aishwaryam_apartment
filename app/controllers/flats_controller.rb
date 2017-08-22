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
		@page = params[:page]
		@floor = @flat.floor
		@block = @floor.block
		add_breadcrumb @block.apartment.name, apartment_path(@block.apartment)
		add_breadcrumb @block.name, block_path(@block)
		add_breadcrumb @floor.name, floor_path(@floor)
		add_breadcrumb @flat.name, edit_flat_path(@flat)
	end

	def update
		params.permit!
		@flat = Flat.find(params[:id])
		floor = @flat.floor
		@flat.update(params[:flat])
		if params[:page] == 'show'
			redirect_to flat_path(@flat)
		else
			redirect_to floor_path(floor)
		end
		flash[:notice] = "Flat updated successfully!"
	end

	def show
		@flat = Flat.find(params[:id])
		@residents = @flat.residents
		@floor = @flat.floor
		@block = @floor.block
		add_breadcrumb @block.apartment.name, apartment_path(@block.apartment)
		add_breadcrumb @block.name, block_path(@block)
		add_breadcrumb @floor.name, floor_path(@floor)
		add_breadcrumb @flat.name, flat_path(@flat)
		@months = Month.all
	end

	def destroy
		@flat = Flat.find(params[:id])
		floor = @flat.floor
		@flat.destroy
		redirect_to floor_path(floor)
		flash[:notice] = "Flat deleted successfully!"
	end

	def edit_water_readings
		@flat = Flat.find(params[:id])
		@months = Month.all
		@floor = @flat.floor
		@block = @floor.block
		add_breadcrumb @block.apartment.name, apartment_path(@block.apartment)
		add_breadcrumb @block.name, block_path(@block)
		add_breadcrumb @floor.name, floor_path(@floor)
		add_breadcrumb @flat.name, flat_path(@flat)
		add_breadcrumb 'Edit water readings', flats_edit_water_readings_path(id: @flat.id)
	end

	def update_water_readings
		params.permit!
		if params[:reading].present?
			params[:reading].each do |month_id, reading|
				WaterReading.create(flat_id: params[:flat_id], month_id: month_id, meter_1: reading[:meter_1], meter_2: reading[:meter_2], meter_3: reading[:meter_3])
			end
		end
		flash[:notice] = "Water readings added successfully!"
		redirect_to flat_path(Flat.find(params[:flat_id]))
	end

end
