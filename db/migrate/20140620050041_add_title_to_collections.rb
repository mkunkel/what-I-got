class AddTitleToCollections < ActiveRecord::Migration
  def change
    add_column("collections", "title", "string", :default => "", :null => false)
  end
end
