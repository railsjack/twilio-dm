class AddResultToTwilioHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :twilio_histories, :result, :text
  end
end
