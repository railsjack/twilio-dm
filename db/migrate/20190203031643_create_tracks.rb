class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :ip
      t.text :headers

      t.timestamps
    end
  end
end
