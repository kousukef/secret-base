FactoryBot.define do
  factory :user, aliases: [:seller] do
    name {'user_1'}
    sequence(:email) {|n| "user_#{n}@example.com"}
    password {'password'}
    password_confirmation {'password'}
  end
end
