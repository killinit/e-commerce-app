class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :name_first

  private
	def current_user
  #if user is logged in, get the user's id from session hash and assign it
  #to @current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id]) 
    end
  end

  def name_first
    if current_user
      puts "here**********"
      @name_first ||= current_user.name_first
    end
  end
end