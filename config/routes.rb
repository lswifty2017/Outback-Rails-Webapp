Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/listings", to: "listings#index", as: "listings"
  get "/listings/:id", to: "listings#show", as: "listing"
  post "/listings", to: "listings#create", as: "create_listing"
  get '/listings/:id/edit', to: 'listings#edit', as: 'edit_listing'
  patch '/listings/:id/edit', to: 'listings#update', as: 'update_listing'
  root 'listings#index'
end
