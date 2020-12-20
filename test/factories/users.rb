FactoryBot.define do
  factory :user do
    name { "taro" }
    email { |n| "test#{n}@test.com" }
    birthday { "2003-01-01" }
    gender { "男性" }
    password { "password" }
    password_confirmation { "password" }
  end
end
