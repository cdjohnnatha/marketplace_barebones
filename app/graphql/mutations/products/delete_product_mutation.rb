module Mutations
  module Products
    class DeleteProductMutation < BaseMutation
      argument :id, ID, required: true
      field :errors, [String], null: false
      field :product, Types::ProductType, null: false

      def resolve(id:)
        product = ::Product.destroy(id)
        if product
          { product: product, errors: nil }
        else product
          { product: product, errors: product.errors.full_messages }
        end
      
      rescue ActiveRecord::ActiveRecordError => invalid
        GraphQL::ExecutionError.new(invalid)
      end
    end
  end
end
