class QuestionChannel < ApplicationCable::Channel
  def subscribed
    stream_from "question_#{current_user.id}_channel"
  end

  def unsubscribed
    stop_all_streams
  end
end
