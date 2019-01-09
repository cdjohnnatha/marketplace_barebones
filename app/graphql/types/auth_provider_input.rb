# frozen_string_literal: true

module Types
  class AuthProviderInput < BaseInputObject
    description "Attributes for auth provider"

    argument :email, String, required: true
    argument :password, String, required: true
  end
end