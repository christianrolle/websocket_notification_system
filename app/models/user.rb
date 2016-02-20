class User < ApplicationRecord
  has_many :relationships
  has_many :followers, through: :relationships
  has_many :leaderships, class_name: Relationship, foreign_key: :follower_id
  has_many :leaders, through: :leaderships, source: :user

  validates :name, presence: true

  scope :by_name, -> { order 'name ASC' }
  scope :excluding, ->(user) { 
    where.not id: user
  }

  def led_by? user
    leaders.include? user
  end
end
