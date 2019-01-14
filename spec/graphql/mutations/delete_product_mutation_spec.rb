# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mutations::Products::DeleteProductMutation do
  let(:product) { create(:product) }
  let(:context) { { } }
  let(:variables) { {} }
  # Call `result` to execute the query
  let(:result) {
    res = MarketplaceBarebonesSchema.execute(
      query_string,
      context: context,
      variables: variables
    )
    if res["errors"]
      pp res
    end
    res
  }
  let(:valid_attr) { attributes_for(:product).to_h }

  describe "destroy user" do
    context "valid attrs" do
      let(:query_string) { %| mutation { deleteProduct(id: #{product.id}) { product { id, price, title, qtyAvailable } } } | }
      
      it_behaves_like "a product fields", "deleteProduct"
    end
    context "Testing errors" do
      context "when a required attribute is nil" do
        let(:query_string) { %| mutation { deleteProduct(id #{nil}") { product { id, title, price, qtyAvailable } } } | }
        it_behaves_like "a common error"
      end
    
      context "when is send a wrong attribute" do
        let(:query_string) { %| mutation { deleteProduct(name: #{product.id}") { product { id, title, price, qtyAvailable } } } | }
        it_behaves_like "a common error"
      end
    
      context "not found id" do
        let(:query_string) { %| mutation { deleteProduct(id: -1) { product { id, title, price, qtyAvailable } } } | }
        it_behaves_like "a common error"
      end
    end
  end
end
