class User < ApplicationRecord
  validates :name, presence: true

  scope :by_name, -> { order 'name ASC' }
end
