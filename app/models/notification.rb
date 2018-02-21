class Notification < ApplicationRecord

  after_create_commit :send_notification

  private

  def send_notification
    user = User.find_by id: self.sender_id

    member_html = ApplicationController.renderer.render partial: "public_activity/member_room", locals: {user: user}

    if self.checked == true
      # user dang o trong phong va an nut san sang
      if self.ready == true
        ActionCable.server.broadcast "room_#{self.receiver_id}_channel", checked: true, ready: true, user_id: self.sender_id
      # user dang o trong phong va an nut san sang
      elsif self.ready ==  false
        ActionCable.server.broadcast "room_#{self.receiver_id}_channel", checked: true, ready: false
      else
      # khi user bat dau join phong
        ActionCable.server.broadcast "room_#{self.receiver_id}_channel", content: member_html, checked: true
      end
    else
      # khi user bat dau roi phong
      ActionCable.server.broadcast "room_#{self.receiver_id}_channel", checked: false, user_id: self.sender_id
    end
  end
end
