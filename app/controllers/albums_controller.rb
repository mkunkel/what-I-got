class AlbumsController < ApplicationController
  before_filter :find_collection

  def index
    @albums = Album.all
  end

  def create
    @album = @collection.albums.new(album_params)
    if @album.save
      redirect_to(action: 'index')
    else
      render 'new'
    end
  end

  def new
    @album = Album.new
  end

  def show
    @album = Album.find_by_id(params[:id])
  end

  private

  def album_params
    params.require(:album).permit(:title, :artist, :genre, :rating, :collection_id, :id)
  end

  def find_collection
    @collection ||= Collection.find(params[:collection_id])
  end
end
