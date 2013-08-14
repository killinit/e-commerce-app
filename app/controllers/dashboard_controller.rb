class DashboardController < ApplicationController
	def show
		@customer = current_user
		#@user = User.find(params[:id])
	end
end