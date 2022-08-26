Rails.application.routes.draw do
  
  resources :books do 
    resources :reviews
  end
  resource :users, only: [:create]
  post "/login", to: "users#login"  
end
