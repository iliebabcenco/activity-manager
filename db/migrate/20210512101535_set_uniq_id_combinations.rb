class SetUniqIdCombinations < ActiveRecord::Migration[6.1]
  def change
    add_index :activity_participations, [:participant_id, :activity_id], :unique => true
  end
end
