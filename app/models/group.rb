class Group < ApplicationRecord
  has_many :activities, foreign_key: 'group_id', class_name: 'Activity', dependent: :destroy
  belongs_to :creator, class_name: 'User'
  validates_format_of :icon, with: /\.(gif|jpe?g|png)$/i,
                             message: 'must have an image extension (jpg, jpe, png, gif)', multiline: true
  validates :name, length: { in: 3..20 }
  validates :icon, presence: true
end
