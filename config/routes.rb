Rails.application.routes.draw do
  get 'appointments/new'
  get 'appointments/create'
  devise_for :users
  root to: "offers#index"
  get "/owner-profile", to: "pages#owner_profile"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :offers, only: %i[index new create]
  resources :users, only: %i[show]
  resources :appointments, only: %i[new create destroy]
  # root "articles#index"
end
