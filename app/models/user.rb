class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  has_many :scores, dependent: :destroy
end
