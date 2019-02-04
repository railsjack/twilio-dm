class TwiliosController < ApplicationController
  require 'twilio-ruby'
  skip_before_action :verify_authenticity_token
  def iframe
  end

  def index
    @twilio = TwilioHistory.new
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

  end

  def send_test

    begin
      account_sid = 'ACe2d52b50ed43b3a051bef93eb054448c'
      auth_token = '91c561d841372ba6a85601306fe6f3fa'
      @client = Twilio::REST::Client.new(account_sid, auth_token)

      message = @client.messages
                    .create(
                        body: '안녕?',
                        from: '+16179345175',
                        to: '+8615524802671'
                    )

      puts message.sid
      @debug = message.sid
      render layout: nil

      rescue Twilio::REST::TwilioError => e
        e.to_s
    end

  end

  def recv_sms
    message = params['Body']
    @result = SmsMailer.with({message: message} ).reply.deliver_now
    # As soon as you receive sms, you can also get email as well, and we can
    # save it into our database.
    @log = "Started
      sending email: #{@result}
    "
    respond_to do |format|
      format.html { render layout: nil }
    end

  end

  def recv_sms_test

  end

  private
  def custom_params
    params.require(:twilio_history).permit(:from, :to, :body)
  end

end
