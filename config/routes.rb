Rails.application.routes.draw do
  devise_for :views, controllers: {
    sessions: 'views/sessions',
    password:  'views/passwords' 
  }
  root "homes#index"
  # delete 'views/sign_out', to: 'devise/sessions#destroy'
  # get "workshops/new"
  post 'workshops/add_to_cart/:id', to: 'workshops#add_to_cart', as: 'add_to_cart'
  delete 'workshops/remove_form_cart/:id', to: 'workshops#remove_from_cart', as:  'remove_from_cart'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :workshops, only: %i[index show new create]
  resources :bookings, only: %i[create] do
    get :booking_details, on: :member
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
