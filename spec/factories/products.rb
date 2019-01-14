# frozen_string_literal: true

require "faker"

FactoryBot.define do
  factory :product do
    title { Faker::Music.instrument }
    price { Faker::Number.decimal(2) }
    qty_available { Faker::Number.between(1, 10) }
  end
end
