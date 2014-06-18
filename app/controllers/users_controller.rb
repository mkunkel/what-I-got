class UsersController < ApplicationController
  def show #profile
    @user = User.find_by_username(params[:id])
    render('show')
  end
end
