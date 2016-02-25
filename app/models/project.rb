class Project < ApplicationRecord
  belongs_to :user
  
  validates :user, presence: true
  validates :topic, presence: true, length: { in: 5..200 }

  scope :by_newest_first, -> { order 'created_at DESC' }
  
  alias_attribute :to_s, :topic
end
