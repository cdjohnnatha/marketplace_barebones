module Mutations
  class SignInMutation < BaseMutation
    argument :email, Types::Inputs::AuthProviderInput, required: true

    type Types::SignInPayloadType

    def resolve(args)
      input = args[:email]
      return unless input

      user = ::User.find_by email: input[:email]
      
      return unless user
      return unless user.authenticate(input[:password])

      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
      token = crypt.encrypt_and_sign("user_id: #{user.id}")

      OpenStruct.new({
        user: user,
        token: token
      })
    rescue ActiveRecord::RecordInvalid => invalid
      GraphQL::ExecutionError.new(invalid)
    end
  end
end
