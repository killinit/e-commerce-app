class PurchasesController < ApplicationController
  def new
  	@purchase = Purchase.new
  	@packages = Package.all
  	@months = ['01','02','03','04','05','06','07','08','09','10',
  						 '11','12']
  	year = Time.now.year
  	@years = []
  	20.times do
  		@years.push year
  		year += 1
  	end
  end

  def create
    puts "params[:purchase]"
    puts params[:purchase]
  	#this action executes when the purchase form is submitted
  	package_id = params[:purchase][:package]
  	purchase_package = Package.find package_id
  	quantity = purchase_package.quantity.to_s
  	amount = purchase_package.price.to_i
  	email = params[:purchase][:email]
  	StripeModel.chargeCreditCard(params[:stripeToken], email, quantity, amount)
 
  	@purchase = Purchase.new purchase_params
  	@purchase.quantity = quantity
  	@purchase.price = amount
  	if @purchase.save	#save method is overridden in the Purchase model
      puts "saved************"
    end
  end

  private
  def purchase_params
    params.require(:purchase).permit(:package, :name_first, :name_last, :phone, :email)
  end
end