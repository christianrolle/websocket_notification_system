class User < ApplicationRecord
  has_many :relationships
  has_many :leader, through: :relationships, source: :user

  validates :name, presence: true

  scope :by_name, -> { order 'name ASC' }
  scope :excluding, ->(user) { 
    where.not id: user
  }
end
