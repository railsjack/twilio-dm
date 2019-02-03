class AddSidToTwilioHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :twilio_histories, :sid, :string
  end
end
