Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'listings#index'
  get "/listings", to: "listings#index", as: "listings"
  get "/listings/:id", to: "listings#show", as: "listing"
  post "/listings", to: "listings#create", as: "create_listing"
  get '/listings/:id/edit', to: 'listings#edit', as: 'edit_listing'
  patch '/listings/:id/edit', to: 'listings#update', as: 'update_listing'
  get  "listings/:id/delete", to: "listings#destroy"
  delete "listings/:id/delete", to: "listings#destroy", as: "destroy_listing"
  get '/user/listings', to: "listings#show_user_listings", as: 'show_user_listings'
  post '/create_booking', to: "bookings#create", as: 'create_booking'
end
