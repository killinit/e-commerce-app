class CredentialsController < ApplicationController
  #render login page
  def new
  	@credential = Credential.new
  end

  #create action executes when login form is submitted
  def create
    @credential = Credential.new(params[:credential])
    if @credential.save
      redirect_to root_url, notice: "Signed Up"
    else
      render :new
    end
  end
  
  #logout
  def destroy
  end
end
