class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  private
  def current_user
  	#if user is logged in, get the user's id from session hash and assign it
  	#to @current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
