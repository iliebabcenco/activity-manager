class Activity < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_one :groups, class_name: 'Group'
end
