class UserMailer < ApplicationMailer
  default from 'wangqsh999@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'http://chihao.co'
    mail to: @user.email, subject: 'Welcome to Chihao.co'
  end
end
