Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
  
  # Routes for the categories and transaction pages.
  resources :groups, only: [:index, :show, :new, :create] do
    resources :purchases, only: [:index, :new, :create]
  end
end
