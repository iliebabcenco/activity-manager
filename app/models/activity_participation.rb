class ActivityParticipation < ApplicationRecord
  belongs_to :participant, class_name: 'User'
  belongs_to :activity, class_name: 'Activity'
end
