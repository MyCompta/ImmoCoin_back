# frozen_string_literal: true

FactoryBot.define do
  factory :property do
    title { "Capsule Corp." }
    price  { "999999999" }
    description { "MyText" }
    association :user, factory: :user
  end
end
