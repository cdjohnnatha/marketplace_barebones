# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  enum state: { OPEN: 0, PURCHASED: 1 }
end
