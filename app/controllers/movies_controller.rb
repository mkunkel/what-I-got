class MoviesController < ApplicationController
  before_filter :find_collection

  def index
    @movies = Movie.all
  end

  def create
    @movie = @collection.movies.new(movie_params)
    if @movie.save
      redirect_to(action: 'index')
    else
      render 'new'
    end
  end

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find_by_id(params[:id])
  end

  def delete
    @movie = Movie.find_by_id(params[:id])
  end

  def destroy
    movie = Movie.find_by_id(params[:id]).destroy
    flash[:notice] = "#{movie.title} was deleted successfully."
    redirect_to(action: "index")
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director, :genre, :rating, :collection_id, :id)
  end

  def find_collection
    @collection ||= Collection.find(params[:collection_id])
  end
end
