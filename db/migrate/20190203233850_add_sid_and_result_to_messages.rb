class AddSidAndResultToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :sid, :string
    add_column :messages, :result, :text
  end
end
