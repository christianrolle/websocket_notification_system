require 'rails_helper'

RSpec.describe User, :type => :model do
  subject { FactoryGirl.build :user }
  
  describe "validations" do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
  end

  context "when saved" do
    describe "scopes" do
      describe ".by_name" do
        let!(:user) { FactoryGirl.create :user, name: 'Bbb' }

        it "should return users ordered by their name ascending" do
          subject.name = 'Aaa'
          subject.save
          expect(User.by_name).to eq([subject, user])
        end
      end

    end
  end
end
