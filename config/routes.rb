Rails.application.routes.draw do
  namespace :api do
      resources :authors, only: [:index, :show, :create, :destroy]
      resources :books, only: [:index, :show, :create, :destroy]
  end
end
