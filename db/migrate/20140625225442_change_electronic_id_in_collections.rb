class ChangeElectronicIdInCollections < ActiveRecord::Migration
  def change
    rename_column :collections, :electronics_id, :electronic_id
  end
end
