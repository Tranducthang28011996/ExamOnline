class Question < ApplicationRecord
  belongs_to :subject
  has_many :exame_questions
  has_many :exames, through: :exame_questions
  has_many :answer, dependent: :destroy

  scope :get_questions, ->subject_id, class_room_id do
    where subject_id: subject_id, class_room_id: class_room_id
  end
end
