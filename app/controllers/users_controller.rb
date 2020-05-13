class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def info
    @user = current_user
  end
end