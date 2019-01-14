# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  scope "(:locale)", locale: /en|nl/ do
    post "/graphql", to: "graphql#execute"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
