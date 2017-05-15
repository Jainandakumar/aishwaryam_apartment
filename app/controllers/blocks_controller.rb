class BlocksController < ApplicationController

	def new
		@block = @apartment.blocks.new
	end

	def create
		params.permit!
		@block = @apartment.blocks.new(params[:block])
		@block.save
		redirect_to apartments_path
		flash[:notice] = "Block created successfully!"
	end

end
