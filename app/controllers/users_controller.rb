class UsersController < ApplicationController

	before_filter :authenticate_user!,except: [:password_change,:password_reset_token,:reset_password,:send_reset_password]

  before_filter :session_destroy,only: [:password_change,:password_reset_token]

	private

  def users_params
    params.require(:user).permit(:username, :email)
  end

end
