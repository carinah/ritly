Rails.application.routes.draw do
  root to: "urls#new"

  get "/urls", to: "urls#new"
end 

# Rails convention: Model is always singular, table is always plural 