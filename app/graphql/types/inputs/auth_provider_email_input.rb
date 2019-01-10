# frozen_string_literal: true

module Types
  module Inputs
    class AuthProviderEmailInput < BaseInputObject
      description "Attributes for auth provider using email"

      argument :email, AuthProviderInput, required: true
    end
  end
end
