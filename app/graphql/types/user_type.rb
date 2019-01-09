# frozen_string_literal: true

module Types
  class UserType < BaseObject
    description "An user type"

    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
  end
end
