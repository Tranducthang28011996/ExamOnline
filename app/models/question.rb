class Question < ApplicationRecord
  belongs_to :subject
  belongs_to :exame
  has_many :answer, dependent: :destroy
end
