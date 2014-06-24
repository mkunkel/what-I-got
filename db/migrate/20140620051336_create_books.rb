class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string "title", :string, :default => "", :null => false
      t.string "author", :string
      t.string "genre", :string
      t.string "rating", :string
      t.string "location", :string

      t.timestamps
    end
  end
end
