FactoryBot.define do
  factory :event do
    title { "Birthday Party" }
    description { "Fun event" }
    location { "Manila" }
    date { 2.days.from_now }
    association :creator, factory: :user
  end
end