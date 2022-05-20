Rails.application.routes.draw do
  root "homes#index"
  # get "workshops/search_form"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :workshops, only: %i[index show]
  resources :bookings, only: %i[create] do
    get :booking_details, on: :member
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
