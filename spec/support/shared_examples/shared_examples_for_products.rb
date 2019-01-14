# frozen_string_literal: true

RSpec.shared_examples "a product fields" do |query_object|
  it "should be returns an product fields" do
    expect(graphql_result).not_to be_blank
    expect(graphql_result).not_to be_empty
    expect(graphql_result[query_object]["product"]).to have_key("title")
    expect(graphql_result[query_object]["product"]).to have_key("price")
    expect(graphql_result[query_object]["product"]).to have_key("qtyAvailable")
  end
end

RSpec.shared_examples "a product attributes" do
  it "should be returns an product attributes" do
    expect(graphql_result).not_to be_blank
    expect(graphql_result).not_to be_empty
    expect(graphql_result[query_object]["product"]["title"]).to eq(attrs[:title])
    expect(graphql_result[query_object]["product"]["price"].to_f).to eq(attrs[:price].to_f)
    expect(graphql_result[query_object]["product"]["qtyAvailable"]).to eq(attrs[:qty_available])
  end
end

RSpec.shared_examples "a products array fields" do |query_object|
  it "should be returns a product array containing all fields" do
    expect(graphql_result).not_to be_blank
    expect(graphql_result).not_to be_empty
    expect(graphql_result[query_object].first).to have_key("title")
    expect(graphql_result[query_object].first).to have_key("price")
    expect(graphql_result[query_object].first).to have_key("qtyAvailable")
  end
end
