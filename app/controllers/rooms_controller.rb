class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find_by(user_id: params[:user_id]) 
    @messages = Message.where(user_id: params[:user_id])
  end
end
