class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string "title", :string, :default => "", :null => false
      t.string "artist", :string
      t.string "genre", :string
      t.string "rating", :string
      t.integer "collection_id"

      t.timestamps
    end
  end
end
