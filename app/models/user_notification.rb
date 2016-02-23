class UserNotification < ApplicationRecord
  belongs_to :user
  belongs_to :notification

  validates :user, :notification, presence: true
end
