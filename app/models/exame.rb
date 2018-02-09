class Exame < ApplicationRecord
  has_many :exame_questions
  has_many :questions, through: :exame_questions
end
