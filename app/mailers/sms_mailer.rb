class SmsMailer < ApplicationMailer
  default to: 'jinnahrae@gmail.com'


  def reply


    @message = params[:message]

    mail from: 'twilio@outlook.com', subject: 'Welcome'


  end


end
