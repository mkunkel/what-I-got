class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string "title", :string, :default => "", :null => false
      t.string "director", :string, :default => ""
      t.string "genre", :string, :default => ""
      t.string "rating", :string, :default => ""
      t.integer "collection_id"

      t.timestamps
    end
  end
end
