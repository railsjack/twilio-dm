class TwilioHistoriesController < ApplicationController
  protect_from_forgery
  require 'twilio-ruby'
  def iframe
  end

  def index
    @twilio_history = TwilioHistory.new
    @twilio_histories = TwilioHistory.all
    respond_to do |format|
      format.html { render layout: nil }
      format.json { render json: {twilio_histories: @twilio_histories} }
    end
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @twilio_history = TwilioHistory.new(custom_params)
    @twilio_history.save
    if @twilio_history.errors.any?
      @error_messages = @twilio_history.errors.messages
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    id = params[:id]
    TwilioHistory.destroy(id)
    respond_to do |format|
      format.html { redirect_to twilio_histories_url+'?'+srand().to_s, notice: 'User was successfully destroyed.' }
    end
  end

  def send_test_old

# Your Account Sid and Auth Token from twilio.com/console
    account_sid = 'ACe2d52b50ed43b3a051bef93eb054448c'
    auth_token = '91c561d841372ba6a85601306fe6f3fa'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    debugger
    message = @client.messages
                  .create(
                      body: '안녕?',
                      from: '+16179345175',
                      to: '+8615524802671'
                  )

    debugger
    puts message.sid
    @debug = message.sid
    render text: 'here'
  end

  private
  def custom_params
    params.require(:twilio_history).permit(:from, :to, :body)
  end
end
