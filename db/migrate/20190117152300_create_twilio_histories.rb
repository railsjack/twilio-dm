class CreateTwilioHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :twilio_histories do |t|
      t.text :body
      t.string :from
      t.string :to

      t.timestamps
    end
  end
end
