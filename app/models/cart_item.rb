class CartItem < ApplicationRecord
  belongs_to :carts
  belongs_to :products
end
