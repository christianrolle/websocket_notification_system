require 'rails_helper'

RSpec.describe User, :type => :model do
  subject { FactoryGirl.build :user }
  
  describe "validations" do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "associations" do
    it { is_expected.to have_many(:relationships) }
    it { is_expected.to have_many(:followers).through(:relationships) }
    it { is_expected.to have_many(:leaderships)
                          .class_name('Relationship')
                          .with_foreign_key('follower_id') }
    it { is_expected.to have_many(:leaders)
                          .through(:leaderships)
                          .source(:user) }
    it { is_expected.to have_many(:user_notifications) }
    it { is_expected.to have_many(:notifications).through(:user_notifications) }
  end

  describe "#to_s" do
    it "should alias #name" do
      expect(subject.to_s).to eq(subject.name)
    end
  end

  context "when saved" do
    describe "scopes" do
      describe ".by_name" do
        let!(:user) { FactoryGirl.create :user, name: 'Bob' }

        it "should return users ordered by their name ascending" do
          subject.name = 'Alice'
          subject.save
          expect(User.by_name).to eq([subject, user])
        end
      end

      describe ".excluding" do
        before { subject.save }
        let!(:user) { FactoryGirl.create :user, name: 'Bob' }

        it "should return all users except a certain user" do
          expect(User.excluding subject).to eq([user])
        end
      end
    end
  end
end
