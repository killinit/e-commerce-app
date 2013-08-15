class CredentialsController < ApplicationController
  #render signup page
  def new
  	@credential = Credential.new
  end

  #create action executes when signup form is submitted
  #note: put create action in Usrs controller
  def create
    @user = User.new credential_params
    if @user
      @user.code = SecureRandom.urlsafe_base64
      @user.expires_at = Time.now + 24.hours
      @user.save
      ActivationMailer.signup_activation(@user).deliver
      redirect_to login_path, 
      notice: "We've sent a validation email to #{@user.email}. Please open your email and click the validation link to validate your account"
    else
      render :new
    end
  end

  # #logout
  # def destroy
  # end

  #move to Users controller
  private
  def credential_params
    params.require(:credential).permit(:email, :password, 
                                       :password_confirmation)
  end
end
