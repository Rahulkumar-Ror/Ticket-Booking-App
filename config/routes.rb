require 'sidekiq/web'
Rails.application.routes.draw do
  # get 'errors/not_found'
  # get 'errors/internal-server_error'
  get 'users/index'
  get 'users/profile'
  
  devise_for :views, controllers: {
    omniauth_callbacks: 'views/omniauth_callbacks',
    registration: 'views'
  }
  get 'ajax/index'
  # get 'workshops#carts/:id'
  root "homes#index"
  # delete 'views/sign_out', to: 'devise/sessions#destroy'
  # get "workshops/new"
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  get 'users/:id/detail', to: "users#detail", as: "user_detail"
  post "workshops/add_to_cart/:id", to: "workshops#add_to_cart", as: "add_to_cart"
  delete "workshops/remove_from_cart/:id", to: "workshops#remove_from_cart", as: "remove_from_cart"
  # post 'workshops/cart/:id', to: 'carts#show', as: 'add_to_cart'
  # delete 'workshops/remove_form_cart/:id', to: 'workshops#remove_from_cart', as:  'remove_from_cart'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  resources :workshops, only: %i[index show new edit update create destroy] do
    resources :comments 
  end
  
  resources :carts, only: %i[show]

  resources :refunds do
    get :refund_acceptance, on: :member
  end

  resources :bookings, only: %i[ new create] do
    get :booking_details, on: :member
  end
  
  mount Sidekiq::Web => '/sidekiq'

  namespace :admin do
    get 'dashboard' => 'dashboard#index'
    resources :workshops 
    resources :bookings
    resources :refunds
    resources :customers
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
