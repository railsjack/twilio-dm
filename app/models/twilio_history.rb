class TwilioHistory < ApplicationRecord
  before_save :send_sms
  validates :from, presence: {message: "Enter the 'from number'."}
  validates :to, presence: {message: "Enter the 'to number'."}
  validates :body, presence: {message: "Enter the 'body number'."}

  private
  def send_sms
    begin
      account_sid = 'ACe2d52b50ed43b3a051bef93eb054448c'
      auth_token = '91c561d841372ba6a85601306fe6f3fa'
      @client = Twilio::REST::Client.new(account_sid, auth_token)
      message = @client.messages
                    .create(
                        body: self.body,
                        from: '+16179345175',
                        #from: self.from,
                        to: self.to
                    )
      self.sid = message.sid
      self.result = message.to_s
      rescue Twilio::REST::TwilioError => e
        self.result = e.to_s
    end
  end
end
