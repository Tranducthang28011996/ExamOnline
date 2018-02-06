class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.text :body
      t.integer :receiver_id
      t.integer :sender_id
      t.boolean :checked
      t.boolean :ready

      t.timestamps
    end
  end
end
