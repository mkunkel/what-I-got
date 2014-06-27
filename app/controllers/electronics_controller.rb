class ElectronicsController < ApplicationController
  before_filter :find_collection

  def index
    @electronics = Electronic.all
  end

  def create
    @electronic = @collection.electronics.new(electronic_params)
    if @electronic.save
      redirect_to(action: 'index')
    else
      render 'new'
    end
  end

  def new
    @electronic = Electronic.new
  end

  def show
    @electronic = Electronic.find_by_id(params[:id])
  end

  def delete
    @electronic = Electronic.find_by_id(params[:id])
  end

  def destroy
    electronic = Electronic.find_by_id(params[:id]).destroy
    flash[:notice] = "#{electronic.name} was deleted successfully."
    redirect_to(action: "index")
  end

  private

  def electronic_params
    params.require(:electronic).permit(:name, :serial, :collection_id, :id)
  end

  def find_collection
    @collection ||= Collection.find(params[:collection_id])
  end
end
