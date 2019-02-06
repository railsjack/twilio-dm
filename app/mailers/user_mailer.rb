class UserMailer < ApplicationMailer
  default to: 'jinnahrae@gmail.com'
  default from: "info@twilio-dm.herokuapp.com"


  def welcome_email


    @greeting = "Hi"
    @params = params
    mail from: params[:email], subject: 'Welcome'


  end

  def reply2welcome_email


    @greeting = "Hi"
    @params = params
    mail to: params[:email], from: 'info@webmobiledev.com', subject: 'Welcome'

  end

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end




end
