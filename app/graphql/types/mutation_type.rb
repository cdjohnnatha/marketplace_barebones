module Types
  class MutationType < Types::BaseObject
    field :createUser, null: false, mutation: Mutations::User::CreateUser
  end
end
