require 'rails_helper'

RSpec.describe ProjectLike, :type => :model do
  subject { FactoryGirl.build :project_like }

  describe "delegations" do
    it { is_expected.to delegate_method(:to_s).to(:project) }
  end

  describe "validations" do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:project) }
    it { is_expected.to validate_uniqueness_of(:project_id).scoped_to(:user_id) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:project) }
  end
end
