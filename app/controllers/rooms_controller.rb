class RoomsController < ApplicationController
  before_action :check_show_roo, only: :show

  def index
    @rooms = Room.all
  end

  def show; end

  def new
    if Relationship.pluck(:followed_id).include? current_user.id
      flash[:danger] = "Ban Dang Thi dau nen khong the tao phong."
      redirect_to root_path
    else
      @room = Room.new
    end
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

  def unfollow
    room = Room.find_by id: params[:id]

    if room.following? current_user
      room.unfollow current_user
      if current_user.id == room.owner
        room.update_attributes owner: room.following.first.id
      end
      redirect_to root_path
    end
  end

  def destroy
    @room = Room.find_by id: params[:id]
    @room.destroy if @room.following.size == 1
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit :user_quantity, :class_room_id, :subject_id, :name
  end


  def check_show_roo
    @room = Room.find_by id: params[:id]
    return redirect_to root_path unless @room
    if (@room.following.size == @room.user_quantity) || (Relationship.pluck(:followed_id).include? current_user.id)
      return if @room.following? current_user
      flash[:danger] = "Phòng đã đủ người."
      redirect_to root_path
    else
      follow_room
    end
  end

  def follow_room
    if !@room.following? current_user
      @room.follow current_user
    end
  end
end
