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

  def delete
    @collection = Collection.find_by_id(params[:id])
  end

  def destroy
    collection = Collection.find_by_id(params[:id]).destroy
    flash[:notice] = "#{collection.title} was deleted successfully."
    redirect_to(:action => "index")
  end

  def edit
    @collection = Collection.find_by_id(params[:id])
  end

  def update
    @collection = Collection.find_by_id(params[:id])
    if @collection.update_attributes(collection_params)
      flash[:notice] = "Collection updated successfully"
      redirect_to(:action => "index")
    else
      render("edit")
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:title, :user)
  end
end
