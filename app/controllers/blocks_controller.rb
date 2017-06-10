class BlocksController < ApplicationController

	def new
		@row = 1
		@apartment = Apartment.find(params[:apartment_id])
		add_breadcrumb @apartment.name, apartment_path(@apartment)
		add_breadcrumb "Add block", new_block_path(apartment_id: @apartment.id)
		@block = @apartment.blocks.new
		if request.xhr?
			@row = params[:row].to_i + 1
			render partial: "new_block"
		end
	end

	def create_block
		apartment = Apartment.find(params[:apartment_id])
		params[:block].values.each do |name|
			block = apartment.blocks.create(name: name)
		end
		redirect_to apartment_path(apartment)
		flash[:notice] = "Block(s) created successfully!"
	end

	def edit
		@block = Block.find(params[:id])
		add_breadcrumb @block.apartment.name, apartment_path(@block.apartment)
		add_breadcrumb "Edit block", edit_block_path(@block)
	end

	def update
		params.permit!
		@block = Block.find(params[:id])
		apartment = @block.apartment
		@block.update(params[:block])
		redirect_to apartment_path(apartment)
		flash[:notice] = "Block updated successfully!"
	end

	def show
		@block = Block.find(params[:id])
		add_breadcrumb @block.apartment.name, apartment_path(@block.apartment)
		add_breadcrumb @block.name, block_path(@block)
		@floors = @block.floors
	end

	def destroy
		@block = Block.find(params[:id])
		apartment = @block.apartment
		@block.destroy
		redirect_to apartment_path(apartment)
		flash[:notice] = "Block deleted successfully!"
	end

end
