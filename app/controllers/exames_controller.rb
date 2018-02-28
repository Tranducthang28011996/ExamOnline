class ExamesController < ApplicationController

  # before_action :all_user_is_start?

  def show
    @number_room = params[:id]
    @room = Room.find_by id: @number_room
    questions = (Exame.where id: @room.exame_id)
      .last.questions.get_questions @room.subject_id, @room.class_room_id
    @room.update_attributes number_question: questions.first.id.to_i
    @question = Question.find_by id: @room.number_question
    @anwser = @question.answers.sample(4)
    @users =

    if request.xhr?
      if params[:i].to_i == 10
        render json: {
          url: result_room_path, status: 1
        }
      else
        question = questions[params[:i].to_i].answers.sample(4)
        if params[:i].to_i == 1
          render json: {
            question_id: questions[params[:i].to_i].id,
            question: questions[params[:i].to_i + 1].name,
            anwser_1: question.first.name,
            anwser_2: question.second.name,
            anwser_3: question.third.name,
            anwser_4: question.last.name
          }
        else
          render json: {
            question_id: questions[params[:i].to_i].id,
            question: questions[params[:i].to_i].name,
            anwser_1: question.first.name,
            anwser_2: question.second.name,
            anwser_3: question.third.name,
            anwser_4: question.last.name
          }
        end
      end
    end
  end

  def start_game
    room = Room.find_by id: params[:id]
    room.update_attributes room_status: 1
    room.following.each do |user|
      ScoreProvisional.where(user_id: user.id).destroy_all
      ScoreProvisional.create user_id: user.id, room_id: params[:id], score: 0
      ActionCable.server.broadcast "start_#{user.id}_channel", url: exames_url
    end
  end

  def result; end

  private

  # def all_user_is_start?
  #   Relationship.is_not_start params[:id] == 0 unless condition
  #     redirect_to room_path
  #   end
  # end

  def make_exame
    @exame = Exame.offset(rand(Exame.count)).first if Exame.present?
  end

end
