class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, uniqueness: true, length: { in: 5..30 }
  validates :username, uniqueness: true, length: { in: 2..30 }
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
    participed_activities.order('schedule_date')
  end
  def all_desc_participations
    participed_activities.order('schedule_date desc')
  end

  def create_external_activity(activity_external_params)
    activity = external_activities.build(activity_external_params)
      ActiveRecord::Base.transaction do
       if activity.save
        act_particip = ActivityParticipation.create(participant_id: self.id, activity_id: activity.id)
      end
    end
      activity
  end
  def create_personal_activity(activity_personal_params)
    activity = personal_activities.build(activity_personal_params)
      ActiveRecord::Base.transaction do
        if activity.save
          act_particip = ActivityParticipation.create(participant_id: self.id, activity_id: activity.id)
        end
      end
      activity
  end

  def self.feed_arr
    arr = Activity.all + Group.all + User.all + ActivityParticipation.all
    ((arr.sort_by &:created_at).reverse)[0..10]
  end

end
