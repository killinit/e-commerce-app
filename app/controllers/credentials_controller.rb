class CredentialsController < ApplicationController
  #render login page
  def new
  	@credential = Credential.new
  end

  #create action executes when signup form is submitted
  def create
    @user = User.new(params[:credential])
    if @user.save
      #send email
      WelcomeMailer.welcome_email(@user).deliver
      redirect_to root_url, notice: "Signed Up"
    else
      render :new
    end
  end

  #logout
  def destroy
  end
end
