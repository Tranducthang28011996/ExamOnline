class Question < ApplicationRecord
  belongs_to :subject
  has_many :exame_questions
  has_many :exames, through: :exame_questions
  has_many :answer, dependent: :destroy
end
