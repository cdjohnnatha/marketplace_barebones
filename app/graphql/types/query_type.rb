# frozen_string_literal: true

module Types
  class QueryType < BaseObject
    field :showUser, UserType, null: false do
      argument :id, ID, required: true
    end
  
    def show_user(id:)
      ::User.find(id)
    end
    
  end
end
