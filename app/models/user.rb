class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #validates :email, uniqueness: true
  #validates :username, uniqueness: true
  has_many :activities, foreign_key: "author_id", class_name: 'Activity', dependent: :destroy

  has_many :activity_participations, foreign_key: "participant_id", class_name: 'ActivityParticipation', dependent: :destroy
  has_many :participed_activities, through: :activity_participations, source: :activity

  has_many :groups, foreign_key: "creator_id", class_name: 'Group', dependent: :destroy
  

  
  def personal_activities
    activities.personal
  end
  def personal_recent_activities
    activities.personal
  end
  def personal_previous_activities
    activities.personal.order('schedule_date desc')
  end
  def external_activities
    activities.all.external
  end
  def external_previous_activities
    activities.all.external.order('schedule_date desc')
  end
  def all_participations
    all_participations = (personal_activities + external_activities + participed_activities).sort_by &:schedule_date
  end
  def all_desc_participations
    all_desc_participations = all_participations.reverse
  end

end
