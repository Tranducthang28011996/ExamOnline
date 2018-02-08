class CreateAnswsers < ActiveRecord::Migration[5.1]
  def change
    create_table :answsers do |t|
      t.text :name
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
