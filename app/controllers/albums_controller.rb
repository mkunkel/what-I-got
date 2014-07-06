class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def create
    @album = @collection.albums.new(album_params)
    if @album.save
      redirect_to(action: :index)
    else
      render :new
    end
  end

  def new
    @album = Album.new
  end

  def show
    album
  end

  def delete
    album
  end

  def destroy
    album.destroy
    flash[:notice] = "#{@album.title} was deleted successfully."
    redirect_to(action: :index)
  end

  private

  def album
    @album ||= Album.find_by_id(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :artist, :genre, :rating, :collection_id, :id)
  end
end
