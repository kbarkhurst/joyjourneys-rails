Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/joys" => "joys#index"
    get "/joys/:search" => "joys#index"
    get "/joys/:id" => "joys#show"

    post "/joys/" => "joys#create"
    patch "/joys/:id" => "joys#update"

    post "/users" => "users#create"
    get "/users/:id" => "users#show"

    post "/sessions" => "sessions#create"
  end
end
