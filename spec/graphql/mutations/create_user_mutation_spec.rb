# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mutations::User::CreateUserMutation do
  let(:user) { create(:user) }
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
  let(:valid_attr) { attributes_for(:user).to_h }

  describe "testing create mutations query" do
    context "creating User" do
      let(:query_string) { %| mutation { createUser(name: "#{valid_attr[:name]}", authProvider: { email: { email: "#{valid_attr[:email]}", password: "#{valid_attr[:password]}" } }) { user { id, name, email } } } | }

      context "when there's current user" do
        it_behaves_like "an user attributes" do
          let(:query_object) { "createUser" }
          let(:attrs) { valid_attr }
        end
        it "expected to errors be null" do
          expect(result["errors"]).to be_blank
        end
      end
      # context "unauthorized" do
      #   let(:context) { nil }
      #   let(:query_string) { %| mutation { createUser(attributes: { name: "#{valid_attr[:name]}", email: "#{valid_attr[:email]}", password: "#{valid_attr[:password]}" }) { user { id, name, email } } } | }

      #   it_behaves_like "an unauthorized", "CreateUserMutationPayload", "user"
      # end
      context "when a required attribute is nil" do
        let(:query_string) { %| mutation { createUser(name: "#{nil}", authProvider: { email: { email: "#{valid_attr[:email]}", password: "#{valid_attr[:password]}" } }) { user { id, name, email } } } | }
        it "should be user:null" do
          expect(result["errors"]).not_to be_blank
        end
      end

      context "when is send a wrong attribute" do
        let(:query_string) { %| mutation { createUser(surname: "#{nil}", authProvider: { email: { email: "#{valid_attr[:email]}", password: "#{valid_attr[:password]}" } }) { user { id, name, email } } } | }
        it "should be user:null" do
          expect(result["errors"]).not_to be_blank
        end
      end
    end
  end
end
