FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) { |n| "example#{n}@tku.ac.jp" }
    password {'password'}
    password_confirmation {'password'}
  end
end