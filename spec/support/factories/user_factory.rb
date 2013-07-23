FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@qanda.com" }
    password "password"
    password_confirmation "password"
  end
end
