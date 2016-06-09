require 'faker'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    name  { Faker::Name.name }
    password 'secret1234'
    password_confirmation { password }

    trait :as_admin do
      email 'admin@example.com'
      admin true
      confirmed true
    end
  end
end