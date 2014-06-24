class CollectionsController < ApplicationController

  def index
    @collections = Collection.all
    @user = current_user.username
    if Collection.where(created_by: current_user.username).first == nil
      @no_collection = "There are currently no collections for this user. Please create one."
      flash[:notice] = "#{@user} currently has no collection. Please create one."
    end
  end

  def new
    @user = current_user.username
    @collection = Collection.new
  end

  def create
    @collection = current_user.collections.new(collection_params)
    if @collection.save
      redirect_to(action: "index")
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
    redirect_to(action: "index")
  end

  def edit
    @collection = Collection.find_by_id(params[:id])
  end

  def update
    @collection = Collection.find_by_id(params[:id])
    if @collection.update_attributes(collection_params)
      flash[:notice] = "Collection updated successfully"
      redirect_to(action: "index")
    else
      render("edit")
    end
  end

  def show
    @collection = Collection.find_by_id(params[:id])
  end

  private

  def collection_params
    params.require(:collection).permit(:title, :user, :created_by, :book)
  end
end
