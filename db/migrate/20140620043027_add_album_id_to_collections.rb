class AddAlbumIdToCollections < ActiveRecord::Migration
  def change
    add_column("collections", "album_id", :integer)
  end
end
