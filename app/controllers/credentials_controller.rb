class CredentialsController < ApplicationController
  #render signup page
  def new
  	@credential = Credential.new
  end

  #create action executes when signup form is submitted
  def create
    @user = User.new credential_params
    if @user
      @user.code = SecureRandom.urlsafe_base64
      @user.expires_at = Time.now + 24.hours
      @user.save
      WelcomeMailer.welcome_email(@user).deliver
      # redirect_to login_path, 
      # notice: "We've just sent a validation email to #{@user.email}. Please check your email to validate your account"
    else
      render :new
    end
  end

  #logout
  def destroy
  end

  private
  def credential_params
    params.require(:credential).permit(:email, :password, 
                                       :password_confirmation)
  end
end
