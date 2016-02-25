class NotificationRelayJob < ApplicationJob
  def perform follower, notification
    response = ApplicationController.render notification
    notification_key = "followers:#{follower.id}:notifications"
    ActionCable.server.broadcast notification_key, notification: response
  end
end
