class Notifier < SimpleDelegator
  alias_method :user, :__getobj__

  def create! subject
    return false if subject.invalid?
    subject.transaction do
      subject.save!
      topic = message subject
      notification = Notification.create!(topic: topic, users: followers)
      notify followers, notification
    end
    subject
  end

  private

  def notify followers, notification
    followers.each do |follower|
      NotificationRelayJob.perform_later follower, notification
    end
  end

  def message model
    key = model.class.name.underscore
    I18n.t "notifications.#{key}", user: user.to_s, name: model.to_s
  end
end
