module Types
  class ProductType < BaseObject
    description "Product fields."

    field :id, ID, null: false
    field :title, String, null: false
    field :price, Float, null: false
    field :qty_available, Integer, null: false
  end
end
