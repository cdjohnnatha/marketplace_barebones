# frozen_string_literal: true

class MarketplaceBarebonesSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
