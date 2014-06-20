class AddGameIdToCollections < ActiveRecord::Migration
  def change
    add_column("collections", "game_id", :integer)
  end
end
