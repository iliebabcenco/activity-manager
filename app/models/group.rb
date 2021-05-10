class Group < ApplicationRecord
    has_many :activities, foreign_key: "groups_id", class_name: 'Activity', dependent: :destroy
    belongs_to :creator, class_name: 'User'
   
end
