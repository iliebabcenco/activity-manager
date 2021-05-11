class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #validates :email, uniqueness: true
  #validates :username, uniqueness: true
  has_many :activities, foreign_key: "author_id", class_name: 'Activity', dependent: :destroy
  has_many :groups, foreign_key: "creator_id", class_name: 'Group', dependent: :destroy
  
  def personal_activities
    activities.personal
  end
  def personal_recent_activities
    activities.personal
  end
  def personal_previous_activities
    activities.personal.order('created_at desc')
  end
  def external_activities
    activities.all.external
  end
  def external_previous_activities
    activities.all.external.order('created_at desc')
  end

end
