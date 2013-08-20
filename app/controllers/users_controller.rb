class UsersController < ApplicationController
  respond_to :json

  def index
    @customers = Customer.all
    #create @orders collection
  end

  def create
    puts "create*********"
    puts params[:customer]
    @customer = Customer.new user_params
    if @customer
      @customer.code = SecureRandom.urlsafe_base64
      @customer.expires_at = Time.now + 24.hours
      @customer.save
      ActivationMailer.signup_activation(@customer).deliver
      redirect_to login_path, 
      notice: "We've sent a validation email to #{@customer.email}. Please open your email and click the validation link to validate your account"
    else
      render :new
    end
  end

  def new
    @customer = Customer.new
  end

  def show
    @customer = current_user
    # @instructor = User.find_by(_type: "Instructor")
  end

  #email validation link was clicked, activate new account
  def edit
    @user = User.find_by(code: params[:code])
  	
    if @user
      if @user.expires_at < Time.now
        redirect_to signup_url, alert: "Your code has expired"
      end
    @user.code = nil
    @user.expires_at = nil
    @user.save
    #login the user
    session[:user_id] = @user.id
    redirect_to user_path(@user.id), alert: "Your account has been activated"
    end
  end

  def update
    lesson_to_update = Lesson.find params[:id]
    lesson_to_update.status = params[:status]
    lesson_to_update.save
    render nothing: true

  	# @user = User.find_by_code(params[:user][:code])
  	# if @user and @user.expires_at > Time.now
  	# 	@user.update_attributes(params[:user])
  	# 	@user.code = nil
  	# 	@user.expires_at = nil
  	# 	if @user.save!
  	# 		#account was updated. Login the user
  	# 		session[:user_id] = @user.id
  	# 		redirect_to dashboard_path(@user.id)
  	# 	else
  	# 		redirect_to dashboard_path(@user.id)
  	# 	end
  	# else
  	# 	render "dashboard/index"
  	# end
  end

  private

  def user_params
    params.require(:customer).permit(:email, :password, 
                                       :password_confirmation)
  end
end