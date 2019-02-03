class UserMailer < ApplicationMailer
  default to: 'jinnahrae@gmail.com'


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





end
