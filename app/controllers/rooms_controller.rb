class RoomsController < ApplicationController
  include RoomsHelper
  before_action :check_show_roo, only: :show
  before_action :make_exame, only: :create

  def index
    @rooms = Room.all
  end

  def show
    if get_relationship_id(current_user).status.nil?
      get_relationship_id(current_user).update status: 0
    end
  end

  def new
    if Relationship.pluck(:followed_id).include? current_user.id
      flash[:danger] = "Ban Dang Thi dau nen khong the tao phong."
      redirect_to root_path
    else
      @room = Room.new
    end
  end

  def create
    @room = current_user.rooms.new room_params.merge(exame_id: @exame.id)
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
      if current_user.id == room.owner && room.following.size > 1
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

  def make_exame
    @exame = Exame.offset(rand(Exame.count)).last if Exame.present?
  end
end
