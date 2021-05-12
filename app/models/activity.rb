class Activity < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :group, optional: true, class_name: 'Group'

  has_many :activity_participations, foreign_key: "activity_id", class_name: 'ActivityParticipation', dependent: :destroy
  has_many :participants, through: :activity_participations, source: :participant
  
  scope :personal, -> { where(group_id: nil) }
  scope :external, -> { where("group_id is not null") }

end
