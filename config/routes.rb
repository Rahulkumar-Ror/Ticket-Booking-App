Rails.application.routes.draw do
  devise_for :views
  root "homes#index"
  # delete 'views/sign_out', to: 'devise/sessions#destroy'
  # get "workshops/new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :workshops, only: %i[index show new create]
  resources :bookings, only: %i[create] do
    get :booking_details, on: :member
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
