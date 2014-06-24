class AddCollectionToBooks < ActiveRecord::Migration
  def change
    add_column :books, :collection, :integer
  end
end
