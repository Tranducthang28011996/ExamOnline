class AddStatusToRelationship < ActiveRecord::Migration[5.1]
  def change
    add_column :relationships, :status, :integer
  end
end
