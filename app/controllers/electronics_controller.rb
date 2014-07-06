class ElectronicsController < ApplicationController

  def index
    @electronics = Electronic.where(collection_id: params[:collection_id])
  end

  def create
    @electronic = @collection.electronics.new(electronic_params)
    if @electronic.save
      redirect_to(action: :index)
    else
      render :new
    end
  end

  def new
    @electronic = Electronic.new
  end

  def show
    electronic
  end

  def delete
    electronic
  end

  def destroy
    electronic.destroy
    flash[:notice] = "#{@electronic.name} was deleted successfully."
    redirect_to(action: :index)
  end

  private

  def electronic
    @electronic ||= Electronic.find_by_id(params[:id])
  end

  def electronic_params
    params.require(:electronic).permit(:name, :serial, :collection_id, :id)
  end
end
