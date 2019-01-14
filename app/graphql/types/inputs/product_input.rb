# frozen_string_literal: true

module Types
  module Inputs
    class ProductInput < BaseInputObject
      description "Attributes for products handling"

      argument :title, String, required: true
      argument :price, Float, required: true
      argument :qty_available, Integer, required: true
    end
  end
  end
