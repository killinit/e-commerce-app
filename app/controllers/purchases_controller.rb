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
  	#when purchase form is submitted, post request goes to this action
  end
end
