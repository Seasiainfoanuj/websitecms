FactoryGirl.define do

  factory :user do
    first_name "Firstname"
    last_name "Lastname"
    sequence(:email) {|n| "test-#{n}@example.com"}
    password "please123"

    trait :admin do
      role "admin"
    end
  end
end
