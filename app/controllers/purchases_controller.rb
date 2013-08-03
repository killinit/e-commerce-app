class PurchasesController < ApplicationController
  def new
  	@purchase = Purchase.new
  end

  def create
  	#when purchase form is submitted, post request goes to this action
  end
end
