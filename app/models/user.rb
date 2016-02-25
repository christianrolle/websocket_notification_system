class User < ApplicationRecord

  has_many :relationships
  has_many :followers, through: :relationships
  has_many :leaderships, class_name: Relationship, foreign_key: :follower_id
  has_many :leaders, through: :leaderships, source: :user
  has_many :user_notifications
  has_many :notifications, through: :user_notifications
  has_many :project_likes

  validates :name, presence: true

  scope :by_name, -> { order 'name ASC' }
  scope :excluding, ->(user) { 
    where.not id: user
  }

  alias_attribute :to_s, :name

end
