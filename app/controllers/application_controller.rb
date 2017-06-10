class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :get_apartment, if: :authenticate_user!

  add_breadcrumb "Apartments", :apartments_path

  def get_apartment
    @apartment = Apartment.first if current_user && Apartment.first.present?
  end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up).push(:username, :email, :password, :remember_me)
  	devise_parameter_sanitizer.for(:sign_in).push(:login, :username, :email, :password, :remember_me)
    devise_parameter_sanitizer.for(:account_update).push(:password, :password_confirmation, :current_password)
  end
end
