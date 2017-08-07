class FloorsController < ApplicationController

	def index
		@block = Block.find(params[:block_id])
		@floors = @block.floors
	end

	def new
		@row = 1
		@block = Block.find(params[:block_id])
		add_breadcrumb @block.apartment.name, apartment_path(@block.apartment)
		add_breadcrumb @block.name, block_path(@block)
		add_breadcrumb "Add floor", new_floor_path(block_id: @block.id)
		@floor = @block.floors.new
		if request.xhr?
			@row = params[:row].to_i + 1
			render partial: "new_floor"
		end
	end

	def create_floor
		block = Block.find(params[:block_id])
		params[:floor].values.each do |name|
			floor = block.floors.create(name: name)
		end
		redirect_to block_path(block)
		flash[:notice] = "Floor(s) created successfully!"
	end

	def edit
		@floor = Floor.find(params[:id])
		@block = @floor.block
		add_breadcrumb @block.apartment.name, apartment_path(@block.apartment)
		add_breadcrumb @block.name, block_path(@block)
		add_breadcrumb "Edit floor", edit_floor_path(@floor)
	end

	def update
		params.permit!
		@floor = Floor.find(params[:id])
		block = @floor.block
		@floor.update(params[:floor])
		redirect_to block_path(block)
		flash[:notice] = "Floor updated successfully!"
	end

	def show
		@floor = Floor.find(params[:id])
		@block = @floor.block
		add_breadcrumb @block.apartment.name, apartment_path(@block.apartment)
		add_breadcrumb @block.name, block_path(@block)
		add_breadcrumb @floor.name, floor_path(@floor)
		@flats = @floor.flats.sort
	end

	def destroy
		@floor = Floor.find(params[:id])
		block = @floor.block
		@floor.destroy
		redirect_to block_path(block)
		flash[:notice] = "Floor deleted successfully!"
	end

	def water_meter_reading
		@floor = Floor.find(params[:floor_id])
		@block = @floor.block
		add_breadcrumb @block.apartment.name, apartment_path(@block.apartment)
		add_breadcrumb @block.name, block_path(@block)
		add_breadcrumb @floor.name, floor_path(@floor)
		add_breadcrumb 'Water Reading', floors_water_meter_reading_path(floor_id: @floor)
		@months = Month.all
		if request.xhr?
			@month_id = Month.find_by_id(params[:month_id])
			@flat_readings = @floor.get_flats_water_reading_for_month(@month_id)
			render partial: 'water_readings'
		else
			@month_id = Time.now.month
			@flat_readings = @floor.get_flats_water_reading_for_month(@month_id)
		end
	end

	def add_water_meter_readings
		if params[:reading].present?
			params[:reading].each do |flat_id, reading|
				WaterReading.create(flat_id: flat_id, month_id: params[:month_id], meter_1: reading[:meter_1], meter_2: reading[:meter_2], meter_3: reading[:meter_3])
			end
		end
		flash[:notice] = "Water readings added successfully!"
		redirect_to floors_water_meter_reading_path(floor_id: params[:floor_id])
	end

end
