class WelcomeMailer < ActionMailer::Base
  default from: "from@matchpoint.com"

  def welcome_email(user)
  	puts "welcome_email*************"
    @user = user
    @url = 'http://localhost:3000/login'
  	mail(to: @user.email, subject: "Match Point account activation")
  end
end
