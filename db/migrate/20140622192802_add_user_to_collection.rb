class AddUserToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :created_by, :string
  end
end
