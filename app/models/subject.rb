class Subject < ApplicationRecord
  has_many :class_room_subjects
  has_many :class_rooms, through: :class_room_subjects, dependent: :destroy
  has_many :question, dependent: :destroy
end
