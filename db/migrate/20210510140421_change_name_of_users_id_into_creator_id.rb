class ChangeNameOfUsersIdIntoCreatorId < ActiveRecord::Migration[6.1]
  def change
      rename_column :groups, :users_id, :creator_id
  end
end
