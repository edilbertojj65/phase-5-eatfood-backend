Rails.application.routes.draw do
  
  resources :reviews , only:  [:index, :show, :create, :destroy, :update]
  resources :photos, only:  [:index, :show, :create, :destroy, :update]
  resources :group_users,  only:  [:index, :show, :create, :destroy, :update]
  resources :groups, only:  [:index, :show, :create, :destroy, :update]
  resources :users, only:  [:index, :show, :create, :destroy, :update]

  get "/sessions", to: "sessions#index"
  post "/login", to: "sessions#create"
  get "/me", to: "users#showlogin"
  delete "/logout", to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
