class AddElectronicsIdToCollections < ActiveRecord::Migration
  def change
    add_column("collections", "electronics_id", :integer)
  end
end
