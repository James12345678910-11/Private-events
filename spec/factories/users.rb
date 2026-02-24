FactoryBot.define do
  factory :user do
    email { "test#{rand(1000)}@mail.com" }
    password { "password123" }
  end
end