class Notification < ApplicationRecord

  after_create_commit :send_notification

  private

  def send_notification
    user = User.find_by id: self.sender_id

    member_html = ApplicationController.renderer.render partial: "public_activity/member_room", locals: {user: user}
    if self.checked == true
      ActionCable.server.broadcast "room_#{self.receiver_id}_channel", content: member_html, checked: true
    else
      ActionCable.server.broadcast "room_#{self.receiver_id}_channel", checked: false, user_id: self.sender_id
    end
  end
end
