class User < ApplicationRecord
  has_many :relationships
  has_many :leaders, through: :relationships, source: :user

  validates :name, presence: true

  scope :by_name, -> { order 'name ASC' }
  scope :excluding, ->(user) { 
    where.not id: user
  }

  def led_by? user
    leaders.include? user
  end
end
