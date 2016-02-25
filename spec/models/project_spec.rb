require 'rails_helper'

RSpec.describe Project, :type => :model do
  subject { FactoryGirl.build :project }

  describe "validations" do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:topic) }
    it { is_expected.to validate_length_of(:topic)
                          .is_at_least(5)
                          .is_at_most(200) }
    it { is_expected.to validate_presence_of(:user) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "#to_s" do
    it "should alias #topic" do
      expect(subject.to_s).to eq(subject.topic)
    end
  end
end
