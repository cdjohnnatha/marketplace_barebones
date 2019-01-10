# frozen_string_literal: true

module Types
  class MutationType < BaseObject
    field :deleteUser, null: false, mutation: Mutations::User::DeleteUserMutation
    field :updateUser, null: false, mutation: Mutations::User::UpdateUserMutation
    field :signIn, null: false, mutation: Mutations::SignInMutation
    field :createUser, null: false, mutation: Mutations::User::CreateUserMutation
  end
end
