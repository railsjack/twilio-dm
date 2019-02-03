class AddSeenToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :seen, :bool
  end
end
