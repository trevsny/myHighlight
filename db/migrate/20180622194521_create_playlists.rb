class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :link
      t.string :image

      t.timestamps null: false
    end
  end
end
