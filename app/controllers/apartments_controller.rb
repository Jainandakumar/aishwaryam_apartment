class ApartmentsController < ApplicationController

	def index
		@apartments = Apartment.all
	end

	def new
		add_breadcrumb "Add apartment", new_apartment_path
		@apartment = Apartment.new
	end

	def show
		@apartment = Apartment.find(params[:id])
		add_breadcrumb @apartment.name, apartment_path(@apartment)
		@blocks = @apartment.blocks
	end

	def create
		params.permit!
		@apartment = Apartment.new(params[:apartment])
		@apartment.save
		flash[:notice] = "Apartment created successfully!"
		redirect_to apartments_path
	end

	def edit
		@apartment = Apartment.find(params[:id])
		add_breadcrumb "Edit #{@apartment.name}", edit_apartment_path(@apartment)
	end

	def update
		params.permit!
		@apartment = Apartment.find(params[:id])
		@apartment.update_attributes(params[:apartment])
		flash[:notice] = "Apartment updated successfully!"
		redirect_to apartments_path
	end

end
