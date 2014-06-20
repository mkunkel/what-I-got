class AddBookIdToCollections < ActiveRecord::Migration
  def change
    add_column("collections", "book_id", :integer)
  end
end
