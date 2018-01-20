module RoomsHelper
  def owner_room id
    User.find_by(id: id).email if id
    "Khong Ten"
  end

  def kind_room quantity_room
    quantity_room == 1 ? "Doi Khang" : "Tap The"
  end

  def class_room_name id
    ClassRoom.find_by(id: id).name
  end

  def subject_name id
    Subject.find_by(id: id).name
  end
end
