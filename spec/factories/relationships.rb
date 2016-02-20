FactoryGirl.define do
  factory :relationship do
    association :user, factory: :user, strategy: :build
    association :follower, factory: :user, strategy: :build
  end
end
