class CreateElectronics < ActiveRecord::Migration
  def change
    create_table :electronics do |t|
      t.string "name", :string, :default => "", :null => false
      t.string "serial", :string, :default => ""
      t.integer "collection_id"

      t.timestamps
    end
  end
end
