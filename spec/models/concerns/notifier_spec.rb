require 'rails_helper'

RSpec.describe Notifier, :type => :model do
  let!(:user) { FactoryGirl.build :user }
  let!(:follower) { FactoryGirl.build :user, name: 'Alice' }

  describe "#user"do
    it "should alias #__getobj_" do
      notifier = Notifier.new user
      expect(notifier.user).to eq(notifier.__getobj__)
    end
  end
  
  describe "#create!"do
    let!(:notifier) { Notifier.new user }

    context "when invalid model" do
      it "should return the model having at least 1 validation error" do
        follower.name = nil
        invalid_follower = notifier.create! follower
        expect(invalid_follower).to be(follower)
        expect(invalid_follower.errors.count).to be > 0
      end
    end

    context "when valid model" do
      let!(:persisted_follower) { notifier.create! follower }

      it "should return the persisted model" do
        expect(persisted_follower).to be(follower)
        expect(persisted_follower.new_record?).to be(false)
      end

      it "should create one notification" do
        expect(Notification.count).to be(1)
      end

      it "should create a notification having a certain topic" do
        notification = Notification.first
        expected_topic = "#{user.name} started following #{follower.name}"
        expect(notification.topic).to eq(expected_topic)
      end
    end

    context "when has followers" do
      before { user.save && user.followers << follower }
      let!(:persisted_follower) { notifier.create! follower }

      it "should notify all followers" do
        user.followers.each do |follower|
          expect(follower.notifications.count).to be(1)
        end
      end
    end
  end
end
