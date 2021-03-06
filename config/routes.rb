Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/joys" => "joys#index"
    get "joys/years/:user_id" => "joys#viewbyyear"
    get "/joys/:id" => "joys#show"
    
    # get "/joys/:search" => "joys#index"

    post "/joys/" => "joys#create"
    patch "/joys/:id" => "joys#update"


    get "/relationships" => "relationships#index"
    post "/relationships" => "relationships#create"

    post "/users" => "users#create"
    get "/users" => "users#show"
    get "/users/:id" => "users#show"

    post "/sessions" => "sessions#create"
  end
end
