class DashboardController < ApplicationController
	def show
		@customer = current_user
		if is_instructor?(@customer)
			@customers = User.all
		end
		#@user = User.find(params[:id])
	end
end