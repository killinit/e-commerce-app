class UsersController < ApplicationController
  def edit
  	@user = User.find_by_code(params[:code])
  	if @user.expires_at < Time.now
  		redirect_to signup_url, alert: "Your code has expired"
  	end
  end

  def update
  	@user = User.find_by_code(params[:user][:code])
  	if @user and @user.expires_at > Time.now
  		@user.update_attributes(params[:user])
  		@user.code = nil
  		@user.expires_at = nil
  		if @user.save!
  			#account was updated. Login the user
  			session[:user_id] = @user.id
  			redirect_to dashboard_path(@user.id)
  		else
  			redirect_to dashboard_path(@user.id)
  		end
  	else
  		render "dashboard/index"
  	end
  end
end
#   	    # Find the user with the unique reset code
#     @user = User.find_by(code: params[:user][:code])
    
#     # If the user exists and the code has not expired
#     # then do the password update and set the code and
#     # expiry to null (expire the reset page)
#     if @user and @user.expires_at > Time.now
#       @user.update_attributes(user_params)
#       @user.code = nil
#       @user.expires_at = nil
      
#       if @user.save
#         # Password update was successful, log the user in and
#         # redirect to the home page
#         session[:user_id] = @user.id
#         redirect_to root_url, notice: "Password changed successfully."
#       else
#         # Password update failed, redirect to the login page
#         redirect_to login_url, alert: "Reset link has expired. Please try again."
#       end
#     else
#       # User not found or code expired, redirect to the login page
#       redirect_to login_url, alert: "Reset link has expired. Please try again."
#     end
#   end
#   end
# end
