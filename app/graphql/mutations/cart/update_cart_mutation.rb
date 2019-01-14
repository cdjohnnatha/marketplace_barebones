module Mutations
  module Cart
    class UpdateCartMutation < BaseMutation
      argument :id, ID, required: true
      argument :state, Types::Inputs::CartStateEnum, required: false

      field :cart, Types::CartType, null: false
      field :errors, [String], null: false

      def resolve(args)
        inputs = {}
        inputs[:state] = args[:state] unless args[:state].nil?
        if inputs.empty?
          return GraphQL::ExecutionError.new(I18n.t(:empty_attributes, model: :cart, scope: [:errors, :messages]))
        end
        cart = ::Cart.find_by(id: args[:id])
        cart.update!(inputs.to_h)

        if cart.valid?
          { cart: cart, errors: nil }
          { cart: cart, errors: [] }
        else
          { cart: nil, errors: cart.errors.full_messages }
        end
        rescue ActiveRecord::ActiveRecordError => invalid
          GraphQL::ExecutionError.new(invalid)
      end
    end
  end
end
