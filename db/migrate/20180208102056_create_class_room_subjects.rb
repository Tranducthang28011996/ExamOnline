class CreateClassRoomSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :class_room_subjects do |t|
      t.references :class_room, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
