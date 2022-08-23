Rails.application.routes.draw do
  devise_for :users
  root to: "offers#index"
  get "/owner-profile", to: "pages#owner_profile"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :offers, only: %i[index new create show]
  resources :user, only: %i[show]
  # root "articles#index"
end
