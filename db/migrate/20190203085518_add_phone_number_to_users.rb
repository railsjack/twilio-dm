class AddPhoneNumberToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :prefix, :string
    add_column :users, :number, :string
  end
end
