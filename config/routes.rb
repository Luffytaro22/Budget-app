Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_scope :user do
    authenticated :user do
      root to: 'groups#index', as: :authenticated_root
    end

    unauthenticated do
      root to: 'users#index', as: :unauthenticated_root
    end
   end

  # Routes for the categories and transaction pages.
  resources :groups, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :purchases, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end
