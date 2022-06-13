Rails.application.routes.draw do
  get 'ajax/index'
  # get 'workshops#carts/:id'

  devise_for :views, controllers: {
    omniauth_callbacks: 'views/omniauth_callbacks',
    sessions: 'views/sessions',
    password:  'views/passwords' 
  }
  root "homes#index"
  # delete 'views/sign_out', to: 'devise/sessions#destroy'
  # get "workshops/new"

  post "workshops/add_to_cart/:id", to: "workshops#add_to_cart", as: "add_to_cart"
  delete "workshops/remove_from_cart/:id", to: "workshops#remove_from_cart", as: "remove_from_cart"
  # post 'workshops/cart/:id', to: 'carts#show', as: 'add_to_cart'
  # delete 'workshops/remove_form_cart/:id', to: 'workshops#remove_from_cart', as:  'remove_from_cart'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :workshops, only: %i[index show new create] do
    resources :comments 
  end
  
  resources :carts, only: %i[show]
  resources :refunds
  resources :bookings, only: %i[ new create] do
    get :booking_details, on: :member
  end
  
  namespace :admin do
    get 'dashboard' => 'dashboard#index'
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
