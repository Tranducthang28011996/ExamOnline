class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "Room"
  belongs_to :followed, class_name: "User"
  after_save :make_notification_when_in_room_or_join_room
  after_destroy :make_notification_leave_room

  scope :created_sort, ->{order created_at: :desc}

  private

  def make_notification_leave_room
    Room.find_by(id: self.follower_id).following.each do |user|
      Notification.create sender_id: self.followed_id, receiver_id: user.id, checked: false
    end
  end

  def make_notification_when_in_room_or_join_room
    if self.status == 1
      Room.find_by(id: self.follower_id).following.each do |user|
        Notification.create sender_id: self.followed_id, receiver_id: user.id, ready: true, checked: true
      end
    elsif self.status == 0
      Room.find_by(id: self.follower_id).following.each do |user|
        Notification.create sender_id: self.followed_id, receiver_id: user.id, ready: false, checked: true
      end
    else
      Room.find_by(id: self.follower_id).following.each do |user|
        Notification.create sender_id: self.followed_id, receiver_id: user.id, checked: true
      end
    end
  end
end
