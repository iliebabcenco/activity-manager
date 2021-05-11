class AddParticipantIdToUser < ActiveRecord::Migration[6.1]
  def change
    
    create_table :activity_participations do |t|
      t.references :users, column: :participant_id, foreign_key: true
      t.references :activities, column: :event_id, foreign_key: true

      t.timestamps
    end
  end
end
