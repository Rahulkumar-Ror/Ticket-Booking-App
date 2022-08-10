require 'sidekiq/web'
Rails.application.routes.draw do
  get 'members/dashboard'
  # get "checkout", to: "checkouts#show"
  # get "billing", to: "billing#show"
  # get 'cart/show'
  # get 'errors/not_found'
  # get 'errors/internal-server_error'
  get 'users/event_schedule'
  get 'users/index'
  get 'users/profile'
  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'
  devise_for :views, controllers: {
    omniauth_callbacks: 'views/omniauth_callbacks',
    registration: 'views'
  }
  get 'ajax/index'
  get 'search/index' => 'search#index'
  get "success", to: "checkouts#success"
  get "cancel", to: "checkouts#cancel"
  # get 'workshops#carts/:id'
  root "homes#index"
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  get 'users/:id/detail', to: "users#detail", as: "user_detail"
  post "checkouts/create", to: "checkouts#create"
  # resources :checkout, only: [:create]
  # post 'workshops/cart/:id', to: 'carts#show', as: 'add_to_cart'
  # delete 'workshops/remove_form_cart/:id', to: 'workshops#remove_from_cart', as:  'remove_from_cart'
  # patch "admin/refunds/:id/process_refund", to: "refunds_controller#process_refund"
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
    resources :customers
    resources :refunds do 
      member do
        patch :process_refund_1
      end
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
