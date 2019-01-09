module Types
  class AuthProviderEmailInput < BaseInputObject
    description "Attributes for auth provider using email"

    argument :email, Types::AuthProviderInput, required: true
  end
end
