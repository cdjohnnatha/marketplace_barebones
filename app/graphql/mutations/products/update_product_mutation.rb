module Mutations
  module Products
    class UpdateProductMutation < BaseMutation
      argument :id, ID, required: true
      argument :title, String, required: false
      argument :price, Float, required: false
      argument :qty_available, Integer, required: false
      
      field :product, Types::ProductType, null: false
      field :errors, [String], null: false

      def resolve(args)
        inputs = {}
        inputs[:title] = args[:title] unless args[:title].nil?
        inputs[:price] = args[:price] unless args[:price].nil?
        inputs[:qty_available] = args[:qty_available] unless args[:qty_available].nil?
        product = ::Product.find_by(id: args[:id])
        product.update!(inputs.to_h)

        if product.valid?
        { product: product, errors: nil }
          { product: product, errors: [] }
        else
          { product: nil, errors: product.errors.full_messages }
        end
        rescue ActiveRecord::ActiveRecordError => invalid
          GraphQL::ExecutionError.new(invalid)
      end
    end
  end
end
