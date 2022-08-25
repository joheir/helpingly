Rails.application.routes.draw do
  devise_for :users
  root to: "offers#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :users, only: %i[show]
  resources :offers, only: %i[index new create show destroy] do
    resources :appointments, only: %i[new create destroy update edit show]
  end
  # root "articles#index"
end
