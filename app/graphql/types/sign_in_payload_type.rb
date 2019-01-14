# frozen_string_literal: true

module Types
  class SignInPayloadType < BaseObject
    description "Attributes for sign in"

    field :token, String, null: false
    field :user, UserType, null: false
  end
end
