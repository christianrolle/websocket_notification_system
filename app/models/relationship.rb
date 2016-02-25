class Relationship < ApplicationRecord

  belongs_to :user
  belongs_to :follower, class_name: User

  validates :user, :follower, presence: true
  validates :follower_id, uniqueness: { scope: :user_id }

  delegate :to_s, to: :user

end
