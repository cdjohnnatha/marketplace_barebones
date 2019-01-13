# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

users = User.create(name: "Shopify User", email: "folks@shopify.com", password: "shopify123")


10.times do
  users = User.create name: Faker::Book.author, email: Faker::Internet.email, password: Faker::Internet.password
end

10.times do
  product = Product.create title: Faker::Music.instrument, price: Faker::Number.decimal(2), qty_available: Faker::Number.between(1, 10)
end
