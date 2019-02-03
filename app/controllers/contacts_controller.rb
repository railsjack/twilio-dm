class ContactsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @contact = Contact.new
  end
  def create
    @contact = Contact.new(contact_params)
    @contact.save
    UserMailer.with(contact_params).welcome_email.deliver_now
    UserMailer.with(contact_params).reply2welcome_email.deliver_now
    redirect_to root_path
  end



  private
  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :budget, :req)
  end

end
