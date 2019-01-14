# frozen_string_literal: true

module Types
  class CartType < BaseObject
    field :id, ID, null: false
    field :total_amount, Float, null: false
    field :status, Types::Inputs::CartStateEnum, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
