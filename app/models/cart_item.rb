# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :carts
  belongs_to :products
end
