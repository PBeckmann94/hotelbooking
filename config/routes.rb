Rails.application.routes.draw do
  root 'store#index', as: 'store_index'


  resources :hotels do
    collection do
      get 'search'
      get 'search_results'
    end
    resources :bookings, only: [:new, :create, :index, :show, :edit, :delete]
  end

end