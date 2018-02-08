Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"

  resources :relationships
  resources :rooms do
    member do
      resources :exames
      get :unfollow
    end
  end
end
