class ElectronicController < ApplicationController
  before_filter :find_collection

  def index
    @electronics = Electronic.all
  end

  def create
    @electronic = @collection.electronic.new(electronic_params)
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

  private

  def electronic_params
    params.require(:electronic).permit(:name, :serial, s:collection_id, :id)
  end

  def find_collection
    @collection ||= Collection.find(params[:collection_id])
  end
end
