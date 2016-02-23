class Notifier < SimpleDelegator
  alias_method :user, :__getobj__

  def create! subject
    return false if subject.invalid?
    subject.transaction do
      subject.save!
      notify user.followers, subject
    end
    subject
  end

  private

  def notify followers, subject
    topic = message subject
    notification = Notification.create! topic: topic
    followers.each do |follower|
      follower.user_notifications.create! notification: notification
    end
  end

  def message model
    key = model.class.name.downcase
    I18n.t "notifications.#{key}", user: user.to_s, name: model.to_s
  end
end
