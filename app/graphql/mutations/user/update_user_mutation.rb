module Mutations
  module User
    class UpdateUserMutation < BaseMutation
      argument :email, String, required: false
      argument :name, String, required: false
      argument :id, ID, required: true

      field :user, Types::UserType, null: false
      field :errors, [String], null: false

      def resolve(args)
        inputs = {}
        inputs[:email] = args[:email] unless args[:email].nil?
        inputs[:name] = args[:name] unless args[:name].nil?
        user = ::User.find_by(id: args[:id])
        user.update!(inputs.to_h)

        if user.valid?
        { user: user, errors: nil }
          { user: user, errors: [] }
        else
          { user: nil, errors: user.errors.full_messages }
        end
        rescue ActiveRecord::ActiveRecordError => invalid
          GraphQL::ExecutionError.new(invalid)
      end
    end
  end
end
