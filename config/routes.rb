Rails.application.routes.draw do
  root 'accounts#show'
  resources :users, only: [:new, :create, :update]
  resource :session, only: [:new, :create, :destroy]
  resource :account, only: [:show]
  resources :goals
  resources :activities, only: [:new, :create] do
    member do
      patch :begin
      patch :end
    end

    collection do
      post :create_for_goal
      post :create_for_leisure
    end
  end
end
