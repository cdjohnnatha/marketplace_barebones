module Mutations
  module User
    class UpdateUserMutation < BaseMutation
      argument :authProvider, Types::Inputs::AuthProviderEmailInput, required: false
      argument :name, String, required: false
      argument :id, ID, required: true

      field :user, Types::UserType, null: false
      field :errors, [String], null: false

      def resolve(args)
        inputs = {}
        if args[:auth_provider]
          inputs[:email] = args[:auth_provider][:email][:email] unless args[:auth_provider][:email][:email].nil?
        end
        inputs[:name] = args[:name] unless args[:name].nil?
        user = ::User.find_by(id: args[:id])
        user.update!(inputs.to_h)

        if user.valid?
        { user: user, errors: nil }
          { user: user, errors: [] }
        else
          { user: nil, errors: user.errors.full_messages }
        
        rescue ActiveRecord::RecordInvalid => invalid
          GraphQL::ExecutionError.new(invalid)
      end
    end
  end
end
