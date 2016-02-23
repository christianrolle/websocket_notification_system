FactoryGirl.define do
  factory :user_notification do
    association :user, strategy: :build
    association :notification, strategy: :build
  end
end
