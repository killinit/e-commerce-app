class SessionsController < ApplicationController
  #render login page
  def new
  end

  #when login form is submitted
  def create
  	user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Invalid Login"
      render :new
    end
  end

  #logout
  def destroy
  end
end
