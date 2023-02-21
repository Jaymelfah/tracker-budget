Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'categories#index', as: :authenticated_root
    end
    unauthenticated do
      root 'splash_screen#index', as: :unauthenticated_root
    end
  end

  resources :categories, only: [:index, :new, :create, :show, :destroy] do
    resources :expenditures, only: [:index, :new, :create, :show, :destroy]
  end
end
