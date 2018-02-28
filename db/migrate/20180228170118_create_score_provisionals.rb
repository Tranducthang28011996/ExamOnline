class CreateScoreProvisionals < ActiveRecord::Migration[5.1]
  def change
    create_table :score_provisionals do |t|
      t.integer :user_id
      t.integer :room_id
      t.integer :score

      t.timestamps
    end
  end
end
