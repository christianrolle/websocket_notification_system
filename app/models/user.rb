class User < ApplicationRecord
  validates :name, presence: true

  scope :by_name, -> { order 'name ASC' }
  scope :excluding, ->(user) { 
    where.not id: user
  }
end
