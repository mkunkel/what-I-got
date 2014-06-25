class ChangeCollectionsColumnInBooks < ActiveRecord::Migration
  def change
    rename_column :books, :collection, :collection_id
  end
end
