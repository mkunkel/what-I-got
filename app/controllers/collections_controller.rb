class CollectionsController < ApplicationController
  before_filter :find_collection

  def index
    @collections = current_user.collections
    if current_user.collections.empty?
      @no_collection = "There are currently no collections for this user. Please create one."
    end
    @user = current_user.username
  end

  def new
    @user = current_user.username
    @collection = Collection.new
  end

  def create
    @collection = current_user.collections.new(collection_params)
    if @collection.save
      redirect_to collections_path
    else
      render :new
    end
  end

  def destroy
    @collection.destroy
    flash[:notice] = "#{@collection.title} was deleted successfully."
    redirect_to(action: :index)
  end

  def update
    if @collection.update_attributes(collection_params)
      flash[:notice] = "Collection updated successfully"
      redirect_to(action: :index)
    else
      render :edit
    end
  end

  private

  def find_collection
    @collection ||= Collection.find_by_id(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:title, :user, :created_by, :book)
  end
end
