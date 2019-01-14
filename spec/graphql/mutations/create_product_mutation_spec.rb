# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mutations::Products::CreateProductMutation do
  let(:product) { create(:product) }
  let(:context) { {} }
  let(:variables) { {} }
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

  describe "testing create product mutations query" do
    context "creating Product" do
      let(:query_string) { %| mutation { createProduct(product: { title: "#{valid_attr[:title]}", price: #{valid_attr[:price]}, qtyAvailable: #{valid_attr[:qty_available]} }) { product { id, title, price, qtyAvailable } } } | }

      context "valid attrs" do
        it "expected to errors be null" do
          expect(result["errors"]).to be_blank
        end
        it_behaves_like "a product attributes" do
          let(:attrs) { valid_attr }
          let(:query_object) { "createProduct" }
        end
        it_behaves_like "a product fields", "createProduct"
      end
      context "when a required attribute is nil" do
        let(:query_string) { %| mutation { createProduct(product: { title: "#{nil}", price: #{valid_attr[:price]}, qtyAvailable: #{valid_attr[:qty_available]} }) { product { id, title, price, qtyAvailable } } } | }
        it "should be product error" do
          expect(result["errors"]).not_to be_blank
        end
      end

      context "when is send a wrong attribute" do
        let(:query_string) { %| mutation { createProduct(product: { name: "#{valid_attr[:title]}", price: #{valid_attr[:price]}, qtyAvailable: #{valid_attr[:qty_available]} }) { product { id, title, price, qtyAvailable } } } | }
        it "should be product attribute null as return" do
          expect(result["errors"]).not_to be_blank
        end
      end
    end
  end
end
