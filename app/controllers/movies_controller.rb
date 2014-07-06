class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def create
    @movie = @collection.movies.new(movie_params)
    if @movie.save
      redirect_to(action: :index)
    else
      render :new
    end
  end

  def new
    @movie = Movie.new
  end

  def show
    movie
  end

  def delete
    movie
  end

  def destroy
    movie.destroy
    flash[:notice] = "#{@movie.title} was deleted successfully."
    redirect_to(action: :index)
  end

  private
  def movie
    @movie ||= Movie.find_by_id(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :director, :genre, :rating, :collection_id, :id)
  end
end
