class Activity < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_one :groups, class_name: 'Group'
  scope :personal, -> { where(group_id: nil) }
  scope :external, -> { where(group_id: !nil) }
end
