# frozen_string_literal: true

require "rails_helper"

RSpec.describe Types::UserType do
  let(:user) { create(:user) }
  let(:contexts) { { current_user: user } }
  let(:variables) {}
  # Call `result` to execute the query
  let(:result) {
    res = CsliRailsSchema.execute(
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

  describe "listUsers query" do
    before { create_list(:user, 5) }
    let(:query_string) { %|{ listUsers { id, name, email } }| }

    context "when there's current user" do
      it "it should be not nil" do
        expect(result["data"]["listUsers"].count).to be > 0
        expect(result["data"]["listUsers"]).not_to be_empty
        expect(result["data"]["listUsers"]).not_to be_blank
      end
    end
    context "when there's no current user" do
      let(:contexts) { {} }

      it_behaves_like "an unauthorized", "Users", "listUsers"
    end
  end
  describe "showUser query" do
    let(:query_string) { "{ showUser(id: #{user.id}) { id, name, email } }" }

    context "when there's a current user" do
      it "should be an user" do
        expect(result["data"]).not_to be_blank
        expect(result["data"]).not_to be_empty
        expect(result["data"]["showUser"]).to have_key("email")
        expect(result["data"]["showUser"]).to have_key("name")
        expect(result["data"]["showUser"]).to have_key("id")
      end
    end
    context "when there's no current user" do
      let(:contexts) { {} }

      it_behaves_like "an unauthorized", "Users", "showUser"
    end
  end
end
