Rails.application.routes.draw do
  root to: "urls#new"

  get "/urls", to: "urls#new", as: "urls" 

  post "/urls", to: "urls#create"

  get "/urls/:id", to: "urls#show", as: "url"

  get "/urls/:id/edit", to: "urls#edit" 

  put "/urls/:id", to: "urls#update"

  get "/urls/all", to: "urls#index", as: "index"  
end 

# Rails convention: Model is always singular, table is always plural 