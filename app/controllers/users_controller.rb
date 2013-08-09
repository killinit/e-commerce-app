class UsersController < ApplicationController
  def edit
  	@user = User.find_by_code(params[:code])
  	if @user
  		puts "user found****************"
  		puts @user.email
  	else
  		puts "Not found****************"
  	end
  end
end
