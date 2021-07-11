class AddReferenceToCreator < ActiveRecord::Migration[6.1]
  def change
    rename_column :activities, :groups_id, :group_id
    add_reference :groups, :users, column: :creator_id, foreign_key: true
  end
end
