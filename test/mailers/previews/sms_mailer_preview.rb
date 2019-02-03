# Preview all emails at http://localhost:3000/rails/mailers/sms_mailer
class SmsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sms_mailer/reply
  def reply
    SmsMailer.reply
  end

end
