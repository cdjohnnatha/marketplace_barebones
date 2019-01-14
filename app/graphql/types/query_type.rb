# frozen_string_literal: true

module Types
  class QueryType < BaseObject
    field :showUser, UserType, null: false do
      argument :id, ID, required: true
    end

    def show_user(id:)
      ::User.find(id)
    end

    field :listProducts, [ProductType], null: false do
      argument :include_deleted, Boolean, "Include all deleted products", required: false, default_value: false
      argument :available_only, Boolean, "Show a list just with available products, at least 1 at store", required: false, default_value: false
    end

    def list_products(include_deleted:, available_only:)
      if available_only
        product = ::Product.where("qty_available > 0")
      else
        product = ::Product.all
      end

      if include_deleted
        return product.with_deleted
      end

      product
    end

    field :showProduct, ProductType, null: false do
      argument :id, ID, required: true
    end

    def show_product(id:)
      ::Product.find(id)
    end
  end
end
