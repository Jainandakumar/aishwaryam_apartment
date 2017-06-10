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
		@flats = @floor.flats
	end

	def destroy
		@floor = Floor.find(params[:id])
		block = @floor.block
		@floor.destroy
		redirect_to block_path(block)
		flash[:notice] = "Floor deleted successfully!"
	end

end
