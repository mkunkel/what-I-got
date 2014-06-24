class AddMovieIdToCollections < ActiveRecord::Migration
  def change
    add_column("collections", "movie_id", :integer)
  end
end
