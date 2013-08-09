class CredentialsController < ApplicationController
  #render login page
  def new
  	@credential = Credential.new
  end

  #create action executes when signup form is submitted
  def create
    @user = User.new(params[:credential])
    if @user.save
      #send email to validate account
      @user.code = SecureRandom.urlsafe_base64
      @user.expires_at = Time.now + 24.hours
      @user.save
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
