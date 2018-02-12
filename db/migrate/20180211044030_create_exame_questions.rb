class CreateExameQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :exame_questions do |t|
      t.references :exame, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
