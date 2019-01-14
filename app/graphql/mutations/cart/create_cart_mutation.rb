# frozen_string_literal: true

module Mutations
  module Cart
    class CreateCartMutation < BaseMutation
      null true

      # argument :cartItems, Types::Inputs::ProductInput, required: true
      argument :userId, ID, required: true

      field :cart, Types::CartType, null: false
      field :errors, [String], null: false

      def resolve(args)
        isOpenCart = ::Cart.where("state = 0 and user_id = #{args[:user_id]}").exists?
        puts isOpenCart
        if isOpenCart
          return GraphQL::ExecutionError.new(I18n.t(:already_opened_cart, attribute: args[:user_id], scope: [:errors, :messages]))
        end

        cart = ::Cart.create!(user_id: args[:user_id])
        if cart.valid?
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
