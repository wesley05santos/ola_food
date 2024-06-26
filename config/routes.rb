Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/about', to: 'home#about'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  post 'selected_customer', to: 'orders#selected_customer'

  resources :products
  resources :customers
  resources :orders
  resources :configurations
  resources :payments, only: %i[new create]

  # Defines the root path route ("/")
  # root "posts#index"
end
