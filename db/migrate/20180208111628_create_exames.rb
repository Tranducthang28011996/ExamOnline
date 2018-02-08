class CreateExames < ActiveRecord::Migration[5.1]
  def change
    create_table :exames do |t|

      t.timestamps
    end
  end
end
