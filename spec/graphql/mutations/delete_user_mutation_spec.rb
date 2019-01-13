# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mutations::User::DeleteUserMutation do
  let(:user) { create(:user) }
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
  let(:valid_attr) { attributes_for(:user).to_h }

  describe "destroy user" do
    context "valid attrs" do
      let(:query_string) { %| mutation { deleteUser(id: #{user.id}) { user { id, name, email } } } | }
      it "it should be success" do
        expect(graphql_result["deleteUser"]).not_to be_empty
        expect(graphql_result["deleteUser"]["user"]["id"].to_i).to eq(user[:id])
        expect(graphql_result["deleteUser"]["user"]["name"]).to eq(user[:name])
        expect(graphql_result["deleteUser"]["user"]["email"]).to eq(user[:email])
      end
    end
    context "Testing errors" do
      context "when a required attribute is nil" do
        let(:query_string) { %| mutation { deleteUser(id #{nil}") { user { id, name, email } } } | }
        it_behaves_like "a common error"
      end
    
      context "when is send a wrong attribute" do
        let(:query_string) { %| mutation { deleteUser(name: #{user.id}") { user { id, name, email } } } | }
        it_behaves_like "a common error"
      end
    
      context "not found id" do
        let(:query_string) { %| mutation { deleteUser(id: -1) { user { id, name, email } } } | }
        it_behaves_like "a common error"
      end
    end
  end
end
