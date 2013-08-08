class CredentialsController < ApplicationController
  #render login page
  def new
  	@credential = Credential.new
  end

  #create action executes when login form is submitted
  def create
    @user = User.new(params[:credential])
    if @user.save
      redirect_to root_url, notice: "Signed Up"
    else
      render :new
    end
  end

  #logout
  def destroy
  end
end
