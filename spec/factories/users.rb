require 'faker'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    name  { Faker::Name.name }
    password 'secret1234'
    password_confirmation { password }

    trait :admin_user do
      email 'admin@example.com'
      password '00000000'
      password_confirmation { password }
      admin true
      confirmed true
    end
  end
end