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
  	package_id = params[:purchase][:package]
  	purchase_package = Package.find package_id
  	quantity = purchase_package.quantity.to_s
  	amount = purchase_package.price.to_i
  	email = params[:purchase][:email]

 
  	customer = Stripe::Customer.create(
      :email => email,
      :card  => params[:stripeToken]
    )

 		#charge user's credit card
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => amount,
      :description => quantity + ' lesson package',
      :currency    => 'usd'
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to purchases_path  	
  	# @purchase = Purchase.new params[:purchase]
  end
end
