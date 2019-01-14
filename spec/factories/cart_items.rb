# frozen_string_literal: true

FactoryBot.define do
  factory :cart_item do
    carts { nil }
    products { nil }
    price { "9.99" }
    qty_products { 1 }
  end
end
