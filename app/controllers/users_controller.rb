class UsersController < ApplicationController
  def info
    @user = User.find(params[:id])
  end
end