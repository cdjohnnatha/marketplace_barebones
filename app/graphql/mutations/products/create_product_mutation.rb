module Mutations
  module Products
    class CreateProductMutation < BaseMutation
    null true

    argument :product, Types::Inputs::ProductInput, required: true

    field :product, Types::ProductType, null: false
    field :errors, [String], null: false

    def resolve(args)
      input = args[:product] unless args[:product].nil?

      product = ::Product.create!(
        title: input[:title],
        price: input[:price],
        qty_available: input[:qty_available]
      )

      if product.valid?
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
