class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :level
      t.integer :owner
      t.integer :user_quantity
      t.integer :class_room_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
