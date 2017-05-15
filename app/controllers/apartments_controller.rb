class ApartmentsController < ApplicationController

	def index
		@blocks = @apartment.blocks if @apartment
	end

	def new
		@apartment = Apartment.new
	end

	def create
		params.permit!
		@apartment = Apartment.new(params[:apartment])
		@apartment.save
		redirect_to apartments_path
	end

end
