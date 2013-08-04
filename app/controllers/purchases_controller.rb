class PurchasesController < ApplicationController
  def new
  	@purchase = Purchase.new
  	@packages = Package.all
  end

  def create
  	#when purchase form is submitted, post request goes to this action
  end
end
