FactoryGirl.define do
  factory :project do
    topic "Project"
    association :user, factory: :user, strategy: :build
  end
end
