# frozen_string_literal: true
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Faker.locale = 'fr'
users =[]

10.times do
  users << User.create(email: Faker::Internet.email, password: "password")

end

10.times do
  Property.create(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, price: rand(100_000..1_000_000), user_id: users.sample.id, location: Faker::Address.city, furnished: [true, false].sample, surface: rand(10..100), room: rand(1..10), floor: rand(0..10), terrace: [true, false].sample, garden: [true, false].sample, caretaker: [true, false].sample, lift: [true, false].sample)
end
