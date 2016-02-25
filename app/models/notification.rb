class Notification < ApplicationRecord

  has_many :user_notifications
  has_many :users, through: :user_notifications

  alias_attribute :to_s, :topic
end
