class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def info
  end

  def redirect_to_new_user_registration_path
    redirect_to new_user_registration_path
  end
end