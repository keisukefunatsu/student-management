require 'faker'

FactoryGirl.define do
  factory :information, class: Information  do
    title 'お知らせ'
    content 'お知らせ１'
    start_date 2.day.since
    expire_date 1.day.since
  end
end