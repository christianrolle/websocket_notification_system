class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follower, class_name: User

  validates :user, :follower, presence: true
end
