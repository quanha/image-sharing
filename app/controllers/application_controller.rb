class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  @title = 'Shoe'

  protect_from_forgery with: :exception


end
