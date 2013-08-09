class SessionsController < ApplicationController
  def new
    #render login page
  end

  #when login form is submitted
  def create
  	user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      render "dashboard/index"
      # redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Invalid Login"
      render :new
    end
  end

  #logout
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
