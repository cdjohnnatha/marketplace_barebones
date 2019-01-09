# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :createUser, null: false, mutation: Mutations::User::CreateUserMutation
  end
end
