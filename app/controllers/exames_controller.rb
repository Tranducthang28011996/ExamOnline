class ExamesController < ApplicationController
  before_action :all_user_is_start?
  def show
    @number_room = params[:id]
    if request.xhr?
      if params[:i].to_i == 10
        render json: {
          url: result_room_path, status: 1
        }
      else
        room = Room.find_by id: @number_room
        @question = (Exame.where id: room.exame_id).last.questions.get_questions room.subject_id, room.class_room_id
        render json: {
          question: @question[params[:i].to_i].name
        }
      end
    end
  end

  def start_game
    room = Room.find_by id: params[:id]
    room.following.each do |user|
      ActionCable.server.broadcast "start_#{user.id}_channel", url: exames_url
    end
  end

  def result; end

  private

  def all_user_is_start?
    binding.pry
  end
end
