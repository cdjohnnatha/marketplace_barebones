# frozen_string_literal: true

require "rails_helper"

RSpec.describe Types::ProductType do
  let(:product) { create(:product) }
  let(:contexts) {}
  let(:variables) {}
  # Call `result` to execute the query
  let(:result) {
    res = MarketplaceBarebonesSchema.execute(
      query_string,
      context: contexts,
      variables: variables
    )
    # Print any errors
    if res["errors"]
      pp res
    end
    res
  }
  describe "Products query" do
    describe "showProduct" do
      context "all attributes" do
        let(:query_string) { "{ showProduct(id: #{product.id}) { id, title, price, qtyAvailable } }" }
        it "should show a product details" do
          expect(result["data"]).not_to be_blank
          expect(result["data"]).not_to be_empty
          expect(result["data"]["showProduct"]).to have_key("title")
          expect(result["data"]["showProduct"]).to have_key("price")
          expect(result["data"]["showProduct"]).to have_key("qtyAvailable")
          expect(result["data"]["showProduct"]).to have_key("id")
        end
      end

      context "Just id" do
        let(:query_string) { "{ showProduct(id: #{product.id}) { id } }" }
        it "should show a product details" do
          expect(result["data"]).not_to be_blank
          expect(result["data"]).not_to be_empty
          expect(result["data"]["showProduct"]).to have_key("id")
        end
      end

      context "Just title" do
        let(:query_string) { "{ showProduct(id: #{product.id}) { title } }" }
        it "should show a product details" do
          expect(result["data"]).not_to be_blank
          expect(result["data"]).not_to be_empty
          expect(result["data"]["showProduct"]).to have_key("title")
        end
      end

      context "Just price" do
        let(:query_string) { "{ showProduct(id: #{product.id}) { price } }" }
        it "should show a product details" do
          expect(result["data"]).not_to be_blank
          expect(result["data"]).not_to be_empty
          expect(result["data"]["showProduct"]).to have_key("price")
        end
      end

      context "Just qtyAvailable" do
        let(:query_string) { "{ showProduct(id: #{product.id}) { qtyAvailable } }" }
        it "should show a product details" do
          expect(result["data"]).not_to be_blank
          expect(result["data"]).not_to be_empty
          expect(result["data"]["showProduct"]).to have_key("qtyAvailable")
        end
      end

      context "missing required params" do
        let(:query_string) { "{ showProduct() { id, title, price, qtyAvailable } }" }
        it "should be product attribute null as return" do
          expect(result["errors"]).not_to be_blank
        end
      end
    end

    describe "Listing all Products" do
      before { create_list(:product, 5) }
      context "all products with no constraints" do
        let(:query_string) { "{ listProducts{ id, title, price, qtyAvailable } }" }

        it "should have a list of products" do
          expect(graphql_result["listProducts"].length).to be >= 1
        end
        it_behaves_like "a products array fields", "listProducts"
      end
      context "select products id with no constraints" do
        let(:query_string) { "{ listProducts{ id } }" }

        it "should have a list of products with id" do
          expect(graphql_result["listProducts"].length).to be >= 1
          expect(graphql_result["listProducts"].first).to have_key("id")
          expect(graphql_result["listProducts"].first).not_to have_key("title")
          expect(graphql_result["listProducts"].first).not_to have_key("price")
          expect(graphql_result["listProducts"].first).not_to have_key("qtyAvailable")
        end
      end
      context "select products title with no constraints" do
        let(:query_string) { "{ listProducts{ title } }" }

        it "should have a list of products with title" do
          expect(graphql_result["listProducts"].length).to be >= 1
          expect(graphql_result["listProducts"].first).to have_key("title")
          expect(graphql_result["listProducts"].first).not_to have_key("id")
          expect(graphql_result["listProducts"].first).not_to have_key("price")
          expect(graphql_result["listProducts"].first).not_to have_key("qtyAvailable")
        end
      end
      context "select products price with no constraints" do
        let(:query_string) { "{ listProducts{ price } }" }

        it "should have a list of products with price" do
          expect(graphql_result["listProducts"].length).to be >= 1
          expect(graphql_result["listProducts"].first).to have_key("price")
          expect(graphql_result["listProducts"].first).not_to have_key("id")
          expect(graphql_result["listProducts"].first).not_to have_key("title")
          expect(graphql_result["listProducts"].first).not_to have_key("qtyAvailable")
        end
      end
      context "select products qtyAvailable with no constraints" do
        let(:query_string) { "{ listProducts{ qtyAvailable } }" }

        it "should have a list of products with qtyAvailable" do
          expect(graphql_result["listProducts"].length).to be >= 1
          expect(graphql_result["listProducts"].first).to have_key("qtyAvailable")
          expect(graphql_result["listProducts"].first).not_to have_key("id")
          expect(graphql_result["listProducts"].first).not_to have_key("title")
          expect(graphql_result["listProducts"].first).not_to have_key("price")
        end
      end

      context "filter just available" do
        before { create(:product, qty_available: 0) }
        let(:query_string) { "{ listProducts(availableOnly: true){ id, title, price, qtyAvailable } }" }

        it "should have a list of products with just 5 and not 6" do
          expect(graphql_result["listProducts"].length).to be == 5
        end
        it_behaves_like "a products array fields", "listProducts"
      end
    end
  end
end
