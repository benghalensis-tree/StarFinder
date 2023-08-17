require 'faker'
FactoryBot.define do
  factory :user do
    name { 'ユーザー1の名前' }
    admin { false }
    email { 'user1@test.com' }
    password { 111111 }
    provider { "#{Faker::Number.between}" }
    uid { "#{Faker::Number.between}" }
  end
  factory :user_2, class: User do
    name { 'ユーザー2の名前' }
    admin { false }
    email { 'user2@test.com' }
    password { 111111 }
    provider { "#{Faker::Number.between}" }
    uid { "#{Faker::Number.between}" }
  end
  factory :admin, class: User do
    name { '管理者' }
    admin { true }
    email { 'admin@test.com' }
    password { 111111 }
    provider { "#{Faker::Number.between}" }
    uid { "#{Faker::Number.between}" }
  end
end