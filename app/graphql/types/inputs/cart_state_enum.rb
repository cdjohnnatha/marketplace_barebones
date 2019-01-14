# frozen_string_literal: true

module Types
  module Inputs
    class CartStateEnum < BaseEnum
      value "OPEN", "The state new Cart"
      value "PURCHASED", "The state purchased transaction of cart"
    end
  end
end
