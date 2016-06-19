class UserController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user

  private
  def authenticate_user
    redirect_to '/admin' if user_signed_in? && !current_user.role.user?
  end

end
