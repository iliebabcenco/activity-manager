class ChangeAcPartColumnNames < ActiveRecord::Migration[6.1]
  def change
    rename_column :activity_participations, :users_id, :participant_id
    rename_column :activity_participations, :activities_id, :activity_id
  end
end
