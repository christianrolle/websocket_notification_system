require 'rails_helper'

RSpec.describe Relationship, :type => :model do
  subject { FactoryGirl.build :relationship }
  
  describe "validations" do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:follower) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:follower).class_name('User') }
  end
end
