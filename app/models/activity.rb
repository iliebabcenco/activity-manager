class Activity < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :group, class_name: 'Group'
  scope :personal, -> { where(group_id: nil) }
  scope :external, -> { where(group_id: !nil) }

  def get_group
    group

  end

end
