class UsersController < ApplicationController
  def index
    @user = User.find_by_username(params[:id])
    render :index
  end

  def show
    render :index
  end

end
