# frozen_string_literal: true

module Mutations
  module User
    class CreateUserMutation < BaseMutation
      null true

      argument :authProvider, Types::Inputs::AuthProviderEmailInput, required: true
      argument :name, String, required: true

      field :user, Types::UserType, null: false
      field :errors, [String], null: false

      def resolve(args)
        user = ::User.create!(
          name: args[:name],
          email: args[:auth_provider][:email][:email],
          password: args[:auth_provider][:email][:password]
        )

        if user.valid?
          { user: user, errors: [] }
        else
          { user: nil, errors: user.errors.full_messages }
        end
        rescue ActiveRecord::RecordInvalid => invalid
          GraphQL::ExecutionError.new(invalid)
      end
    end
  end
end
