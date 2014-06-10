Rails.application.routes.draw do
  root to: "urls#new"

  get "/urls", to: "urls#index", as: "urls" 

  get "/urls/new", to: "urls#new", as: "url_new" 

  post "/urls", to: "urls#create"

  get "/urls/:id", to: "urls#show", as: "url"

  get "/urls/:id/edit", to: "urls#edit" 

  put "/urls/:id", to: "urls#update"

  get "go/:random_string", to: "urls#random_string"

  #get "go/:random_string/preview", to: "preview" 
end 

# Rails convention: Model is always singular, table is always plural 