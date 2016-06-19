class AdminController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :authenticate_admin

    private
    def authenticate_admin
      redirect_to '/' if !user_signed_in? || current_user.role.user?
    end

end
