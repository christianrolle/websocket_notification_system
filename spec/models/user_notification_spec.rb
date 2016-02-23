require 'rails_helper'

RSpec.describe UserNotification, :type => :model do
  subject { FactoryGirl.build :user_notification }
  
  describe "validations" do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:notification) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:notification) }
  end
end
