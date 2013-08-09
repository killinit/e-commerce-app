class WelcomeMailer < ActionMailer::Base
  default from: "from@matchpoint.com"

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/login'
  	mail(to: @user.email, subject: "Welcome to Match Point")
  end
end
