# frozen_string_literal: true

module Types
  module Inputs
    class AuthProviderInput < BaseInputObject
      description "Attributes for auth provider"

      argument :email, String, required: false
      argument :password, String, required: false
    end
  end
end
