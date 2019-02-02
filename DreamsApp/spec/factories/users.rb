require "faker"

FactoryBot.define do
  factory :user do
    username { Faker::HarryPotter.unique.character }
    password { Faker::Internet.password }
  end
end
