class Message < ApplicationRecord

  before_save :filter_values
  before_create :make_seen_true

  def self.new_sent_to(to)
    tmp = []
    where(to: to, seen: false).order(:created_at).select do |message|
      included = tmp.include?(message.from).to_s
      tmp.push(message.from)
      included != "true"
    end
  end

  def self.last_of(message)
    where(from: message.from).or(where(to: message.from)).order(:created_at).last
  end

  def self.previous_messages(from_number, message)
    if message.to == from_number # if I received
      sender_id = message.from
      receiver_id = from_number
    else message.from == from_number # if I sent
      sender_id = from_number
      receiver_id = message.to
    end

    condition1 = {from: sender_id, to: receiver_id}
    condition2 = {to: sender_id, from: receiver_id}
    count = 0
    where(condition1).or(where(condition2))
        .order(created_at: :desc).select do |msg|
      (count = count + 1) > 1
    end
  end

  private
  def filter_values
    self.from = from.remove(/[^\d]/)
    self.to = to.remove(/[^\d]/)
    send_sms
  end

  def make_seen_true
    Message.where(to: to).each do |message|
      #message.update_attribute(:seen, true)
    end
  end

  def send_sms
    begin
      account_sid = 'ACe2d52b50ed43b3a051bef93eb054448c'
      auth_token = '91c561d841372ba6a85601306fe6f3fa'
      @client = Twilio::REST::Client.new(account_sid, auth_token)
      message = @client.messages
                    .create(
                        body: self.content,
                        from: '+16179345175',
                        #from: self.from,
                        to: '+'+self.to
                    )
      self.sid = message.sid
      self.result = message.to_s
    rescue Twilio::REST::TwilioError => e
      self.result = e.to_s
    end
  end

end
