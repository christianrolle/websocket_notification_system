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
      before { follower.name = nil }

      it "should return false" do
        expect(notifier.create! follower).to be(false)
      end

      it "should add validation errors to model" do
        notifier.create! follower
        expect(follower.errors.count).to be > 0
      end
    end

    context "when valid model" do
      let!(:relationship) { FactoryGirl.build :relationship, user: follower }
      let!(:persisted_relationship) { notifier.create! relationship }

      it "should return the persisted model" do
        expect(persisted_relationship).to be(relationship)
        expect(persisted_relationship.new_record?).to be(false)
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
