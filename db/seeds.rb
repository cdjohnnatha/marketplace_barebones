# frozen_string_literal: true


require "faker"

users = User.create(name: "Shopify User", email: "folks@shopify.com", password: "shopify123")


10.times do
  users = User.create name: Faker::Book.author, email: Faker::Internet.email, password: Faker::Internet.password
end

10.times do
  product = Product.create title: Faker::Music.instrument, price: Faker::Number.decimal(2), qty_available: Faker::Number.between(1, 10)
end
