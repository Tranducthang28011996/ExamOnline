class ClassRoom < ApplicationRecord
  has_many :class_room_subjects
  has_many :subjects, through: :class_room_subjects, dependent: :destroy
end
