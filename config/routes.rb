Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"

  resources :relationships
  resources :rooms do
    member do
      resource :exames
      post 'start', to: "exames#start_game"
      get 'result', to: "exames#result"
      get :unfollow
    end
  end
end
