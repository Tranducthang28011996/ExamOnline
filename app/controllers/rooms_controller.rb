class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find_by id: params[:id]
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.new room_params
    @room.owner = current_user.id
    if @room.save
      redirect_to @room
    else
      render :new
    end
  end

  def show

  end

  private

  def room_params
    params.require(:room).permit :user_quantity, :class_room_id, :subject_id, :name
  end
end
