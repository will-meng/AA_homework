class UserMailer < ApplicationMailer
  default from: 'The Crew <everybody@appacademy.io>'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/cats'
    mail(to: 'test@test.com', subject: 'Our Cats Have More Lives Than You!')
  end
end
