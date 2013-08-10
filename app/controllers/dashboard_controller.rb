class DashboardController < ApplicationController

	def index
	end

	def show
		puts "params show"
		@user = User.find(params[:id])
	end
end


# #this action executes when the purchase form is submitted
#   	package_id = params[:purchase][:package]
#   	purchase_package = Package.find package_id
#   	quantity = purchase_package.quantity.to_s
#   	amount = purchase_package.price.to_i
#   	email = params[:purchase][:email]
#   	StripeModel.chargeCreditCard(params[:stripeToken], email, quantity, amount)
 
#   	@purchase = Purchase.new params[:purchase]
#   	@purchase.quantity = quantity
#   	@purchase.price = amount
#   	@purchase.save	#save method is overridden in the Purchase model
