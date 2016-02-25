require 'rails_helper'

RSpec.describe Notification, :type => :model do
  subject { FactoryGirl.build :notification }

  describe "associations" do
    it { is_expected.to have_many(:user_notifications) }
    it { is_expected.to have_many(:users).through(:user_notifications) }
  end

  describe "#to_s" do
    it "should alias #topic" do
      expect(subject.to_s).to eq(subject.topic)
    end
  end
end
