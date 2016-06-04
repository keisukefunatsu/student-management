require 'faker'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'secret1234'
    password_confirmation { password }

    trait :student do
      grade_code { Grade.all.sample.code }
      admin false
    end
  end
end
