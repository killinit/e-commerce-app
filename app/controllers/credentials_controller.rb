class CredentialsController < ApplicationController
  #render login page
  def new
  	@credential = Credential.new
  end

  #when login form is submitted
  def create
  	puts params
  end

  #logout
  def destroy
  end
end
