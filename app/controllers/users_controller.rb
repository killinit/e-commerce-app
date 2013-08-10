class UsersController < ApplicationController
  # def edit
  # 	@user = User.find_by_code(params[:code])
  # 	if @user.expires_at < Time.now
  # 		redirect_to signup_url, alert: "Your code has expired"
  # 	end
  # end

  # def update
  # 	@user = User.find_by_code(params[:user][:code])
  # 	if @user and @user.expires_at > Time.now
  # 		@user.update_attributes(params[:user])
  # 		@user.code = nil
  # 		@user.expires_at = nil
  # 		if @user.save!
  # 			#account was updated. Login the user
  # 			session[:user_id] = @user.id
  # 			redirect_to dashboard_path(@user.id)
  # 		else
  # 			redirect_to dashboard_path(@user.id)
  # 		end
  # 	else
  # 		render "dashboard/index"
  # 	end
  # end
end
