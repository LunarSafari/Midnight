Rails.application.routes.draw do
  root 'accounts#show'
  resources :users, only: [:new, :create, :update]
  resource :session, only: [:new, :create, :destroy]
  resource :account, only: [:show]
  resources :goals
end
