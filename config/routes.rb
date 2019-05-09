Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'listings#index'
  get "/listings", to: "listings#index", as: "listings"
  get'/results', to: "listings#search", as: "listings_search_results"
  get "/listings/:id", to: "listings#show", as: "listing"
  get 'create_listing', to: "listings#create_listing", as: "create_listing_page"
  post "/create_listing", to: "listings#create", as: "create_listing"
  get '/listings/:id/edit', to: 'listings#edit', as: 'edit_listing'
  patch '/listings/:id/edit', to: 'listings#update', as: 'update_listing'
  get  "listings/:id/delete", to: "listings#destroy"
  delete "listings/:id/delete", to: "listings#destroy", as: "destroy_listing"
  get '/user/listings', to: "listings#show_user_listings", as: 'show_user_listings'
  post '/create_booking', to: "bookings#create_check", as: 'booking_check'
  get '/create_booking_post_check', to: "bookings#create", as: 'create_booking'
  get '/user/bookings', to: "bookings#show_user_bookings", as: 'show_user_bookings'
  get '/listings/:id/edit/destroy_image', to: 'listings#destroy_uploaded_images'
  patch '/listings/:id/edit/destroy_image', to: 'listings#destroy_uploaded_images', as: 'destroy_image'
  get '/bookings/payment', to: 'bookings#booking_payment', as: 'booking_payment'
  get "/bookings/:id", to: "bookings#show", as: "booking"
  
  post '/', to: "listings#search", as: "listings_search"
  

  
  get  "bookings/:id/delete", to: "bookings#destroy"
  delete "bookings/:id/delete", to: "bookings#destroy", as: "destroy_booking"

  resources :charges

  default_url_options :host => 'localhost:3000'
end
