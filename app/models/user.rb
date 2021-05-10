class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #validates :email, uniqueness: true
  #validates :username, uniqueness: true
  has_many :activities, foreign_key: "author_id", class_name: 'Activity', dependent: :destroy
  has_many :groups, foreign_key: "creator_id", class_name: 'Group', dependent: :destroy
  
end
