# frozen_string_literal: true

RSpec.shared_examples "an user registration" do
  it "should be returns an user attributes" do
    expect(graphql_result["data"]).not_to be_blank
    expect(graphql_result["data"]).not_to be_empty
    expect(graphql_result).to have_key("data")
    expect(graphql_result).to have_key("status")
    expect(graphql_result["status"]).to eq("success")
    expect(graphql_result["data"]).to have_key("id")
    expect(graphql_result["data"]).to have_key("provider")
    expect(graphql_result["data"]).to have_key("uid")
    expect(graphql_result["data"]).to have_key("name")
    expect(graphql_result["data"]["name"]).to eq(attrs["name"])
    expect(graphql_result["data"]["uid"]).to eq(attrs["email"])
  end
end

RSpec.shared_examples "an user fields" do |query_object|
  it "should be returns an user fields" do
    expect(graphql_result).not_to be_blank
    expect(graphql_result).not_to be_empty
    expect(graphql_result[query_object]["user"]).to have_key("email")
    expect(graphql_result[query_object]["user"]).to have_key("name")
    expect(graphql_result[query_object]["user"]).to have_key("id")
  end
end

RSpec.shared_examples "an user attributes" do
  it "should be returns an user attributes" do
    expect(graphql_result).not_to be_blank
    expect(graphql_result).not_to be_empty
    expect(graphql_result[query_object]["user"]["email"]).to eq(attrs[:email])
    expect(graphql_result[query_object]["user"]["name"]).to eq(attrs[:name])
  end
end
