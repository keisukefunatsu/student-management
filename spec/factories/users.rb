require 'faker'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'secret1234'
    password_confirmation { password }
  end
  factory :admin_user, class: User  do
    name { Faker::Name.name }
    email 'admin@example.com'
    password '00000000'
    password_confirmation { password }
    admin true
    confirmed true
  end
end