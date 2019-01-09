# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :listUsers, [UserType, null: true], null: false, resolve: -> (obj, args, ctx) { User.all }
  end
end
