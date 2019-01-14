# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mutations::Products::UpdateProductMutation do
  let(:product) { create(:product) }
  let(:context) { {} }
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

  describe "testing update product mutations query" do
    context "updating product" do

      context "updating full entries" do
        let(:query_string) { %| mutation { updateProduct(id: #{product.id}, title: "#{valid_attr[:title]}", price: #{valid_attr[:price]}, qtyAvailable: #{valid_attr[:qty_available]}) { product { id, title, price, qtyAvailable } } } | }
        it "expected to have a title, price and qty_available updated" do
          expect(graphql_result["updateProduct"]).to have_key("product")
          expect(graphql_result["updateProduct"]["product"]["title"]).to eq(valid_attr[:title])
          expect(graphql_result["updateProduct"]["product"]["price"].to_f).to eq(valid_attr[:price].to_f)
          expect(graphql_result["updateProduct"]["product"]["qtyAvailable"].to_i).to eq(valid_attr[:qty_available].to_i)
        end
        it "expected to errors be null" do
          expect(graphql_result["updateProduct"]["errors"]).to be_blank
        end
      end
      context "updating just title" do
        let(:query_string) { %| mutation { updateProduct(id: #{product.id}, title: "#{valid_attr[:title]}" ) { product { title } } } | }
        it "expected to have a title updated" do
          expect(graphql_result["updateProduct"]["product"]).not_to be_blank
          expect(graphql_result["updateProduct"]["product"]["title"]).to eq(valid_attr[:title])
        end
        it "expected to errors be null" do
          expect(graphql_result["updateProduct"]["errors"]).to be_blank
        end
      end
      context "updating just price" do
        let(:query_string) { %| mutation { updateProduct(id: #{product.id}, price: #{valid_attr[:price]}) { product { price } } } | }
        it "expected to have a name updated" do
          expect(graphql_result["updateProduct"]["product"]).not_to be_blank
          expect(graphql_result["updateProduct"]["product"]["price"].to_f).to eq(valid_attr[:price].to_f)
        end
        it "expected to errors be null" do
          expect(graphql_result["updateProduct"]["errors"]).to be_blank
        end
      end
      context "updating just qtyAvailable" do
        let(:query_string) { %| mutation { updateProduct(id: #{product.id}, qtyAvailable: #{valid_attr[:qty_available]}) { product { qtyAvailable } } } | }
        it "expected to have a qtyAvailable updated" do
          expect(graphql_result["updateProduct"]["product"]).not_to be_blank
          expect(graphql_result["updateProduct"]["product"]["qtyAvailable"].to_i).to eq(valid_attr[:qty_available].to_i)
        end
        it "expected to errors be null" do
          expect(graphql_result["updateProduct"]["errors"]).to be_blank
        end
      end
      context "Testing errors" do
        context "when a required attribute is nil" do
          let(:query_string) { %| mutation { updateProduct(id: #{product.id}, title: "#{nil}", price: #{valid_attr[:price]}, qtyAvailable: #{valid_attr[:qty_available]}) { product { id, title, price, qtyAvailable } } } | }
          it_behaves_like "a common error"
        end

        context "when is send a wrong attribute" do
          let(:query_string) { %| mutation { updateProduct(id: #{product.id},surname: "#{nil}") { product { id, title, price, qtyAvailable } } } | }
          it_behaves_like "a common error"
        end
        context "when is missing id" do
          let(:query_string) { %| mutation { updateProduct(title: "#{nil}") { product { id, title, price, qtyAvailable } } } | }
          it_behaves_like "a common error"
        end
      end
    end
  end
end
