Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :rooms do
    member do
      get :unfollow
    end
  end
end
