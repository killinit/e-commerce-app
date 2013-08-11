class DashboardController < ApplicationController

	def index
	end

	def show
		puts "params show"
		@user = User.find(params[:id])
	end
end