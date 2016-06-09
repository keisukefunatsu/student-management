require 'faker'

FactoryGirl.define do
  factory :information do
    title 'タイトル'
    content '文章'
    start_date 7.day.since
    expire_date 6.day.since
  end
end
