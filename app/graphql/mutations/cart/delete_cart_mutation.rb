module Mutations
  module Cart
    class DeleteCartMutation < BaseMutation
      argument :id, ID, required: true
      field :errors, [String], null: false
      field :cart, Types::CartType, null: false

      def resolve(id:)
        cart = ::Cart.destroy(id)
        if cart
          { cart: cart, errors: nil }
        else
          { cart: cart, errors: cart.errors.full_messages }
        end

      rescue ActiveRecord::ActiveRecordError => invalid
        GraphQL::ExecutionError.new(invalid)
      end
    end
  end
end
