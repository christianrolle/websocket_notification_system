class Project < ApplicationRecord
  belongs_to :user
  validates :topic, :user, presence: true
end
