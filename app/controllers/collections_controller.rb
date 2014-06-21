class CollectionsController < ApplicationController
  # before_filter :load_books

  def index
     @collections = Collection.all
  end

  def new
    @collection = Collection.new
  end

  # def show
  #   @collections = Collection.find(params[:id])
  # end

  def create

    @collection = current_user.collections.new(collection_params)
    if @collection.save
      redirect_to(:action => "index")
    else
      render 'new'
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:title, :user)
  end
end
