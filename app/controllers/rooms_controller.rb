class RoomsController < ApplicationController
  
  def index
    @room = Room.all
  end
  
  def show
    @chats = ChatMessage.all
  end
end
