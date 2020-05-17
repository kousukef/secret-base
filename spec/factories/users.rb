FactoryBot.define do
  factory :user do
    name { user_test }
    sequence(:email) { |n| "example#{n+1}@tku.ac.jp" }
    password {'password'}
    password_confirmation {'password'}
    avatar { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test1.jpg')) }
    admin {false}
  end
end