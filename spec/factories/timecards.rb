require 'faker'

FactoryGirl.define do
  factory :timecard do
    title Timecard::COMING_TITLE
    user { create(:user) }
  end
end
