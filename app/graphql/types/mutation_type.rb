# frozen_string_literal: true

module Types
  class MutationType < BaseObject
    field :updateUser, mutation: Mutations::User::UpdateUserMutation
    field :signIn, null: false, mutation: Mutations::SignInMutation
    field :createUser, null: false, mutation: Mutations::User::CreateUserMutation
  end
end
