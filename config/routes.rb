Rails.application.routes.draw do
  root to: "urls#new"

  get "/urls", to: "urls#new", as: "url" 

  post "/urls", to: "urls#create"

  get "/urls/show", to: "urls#show"
end 

# Rails convention: Model is always singular, table is always plural 