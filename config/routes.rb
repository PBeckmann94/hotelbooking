Rails.application.routes.draw do
  resources :hotels
  root 'store#index', as: 'store_index'
  resources :bookings
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
