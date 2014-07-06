class RemoveStringFromModels < ActiveRecord::Migration
  def change
    remove_column :albums, :string, :string
    remove_column :books, :string, :string
    remove_column :electronics, :string, :string
    remove_column :movies, :string, :string
  end
end
