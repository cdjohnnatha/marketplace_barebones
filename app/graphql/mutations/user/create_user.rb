module Mutations::User
  class CreateUser < BaseMutation
    null true

    argument :authProvider, Types::AuthProviderEmailInput, required: true
    argument :name, String, required: true
    
    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(args)
      user = ::User.create(
        name: args[:name], 
        email: args[:auth_provider][:email][:email],
        password: args[:auth_provider][:email][:password]
      )

      if user.valid?
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
end
