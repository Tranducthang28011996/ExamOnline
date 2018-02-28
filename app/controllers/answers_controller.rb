class AnswersController < ApplicationController
  def show
    if Question.find_by(id: params[:question_id]).answser  == params[:answer]
      up_score = ScoreProvisional.find_by(user_id: current_user).score.to_i + 10
      ScoreProvisional.find_by(user_id: current_user).update_attributes score: up_score
    end
  end
end
