class Exame < ApplicationRecord
  has_many :question, dependent: :destroy
end
