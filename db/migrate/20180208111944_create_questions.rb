class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :name
      t.text :answser
      t.references :subject, foreign_key: true
      t.references :class_room, foreign_key: true
      t.timestamps
    end
  end
end
