class ExamesController < ApplicationController
  before_action :make_exame, only: :show

  def show
    room = Room.find_by id: params[:id]
    @question = @exame.pluck name

    room.following.each do |user|
      ActionCable.server.broadcast "question_#{user.id}_channel", question: @question.first
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
    @exame = Exame.offset(rand(Exame.count)).first if Exame.present?
  end

end
