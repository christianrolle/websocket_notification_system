FactoryGirl.define do
  factory :project_like do
    association :user, factory: :user, strategy: :build
    association :project, factory: :project, strategy: :build
  end
end
