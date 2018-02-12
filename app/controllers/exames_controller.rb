class ExamesController < ApplicationController
  before_action :make_exame, only: :show
  # after_action :make_question, only: :show

  def show
    @question = @exame.questions.first
    @number_room = params[:id]
    if request.xhr?
      if params[:i].to_i == 10
        render json: {
          url: root_path, status: 1
        }
      else
        exame_id = 1
        @question = @exame.questions[params[:i].to_i]
        render json: {
          question: @question.name, exame_id: exame_id
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

  private

  def make_exame
    # if params[:status].nil?
      @exame = Exame.offset(rand(Exame.count)).first if Exame.present?
    # end
  end
end
