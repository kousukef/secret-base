class RoomsController < ApplicationController
  def show
    @messages = Message.all
    render 'products/show'
  end
  
  
end
