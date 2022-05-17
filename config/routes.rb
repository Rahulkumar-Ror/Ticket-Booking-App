Rails.application.routes.draw do
  root "homes#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :workshops, only: %i[index show]
  # Defines the root path route ("/")
  # root "articles#index"
end
