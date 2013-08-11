ChillClick::Application.routes.draw do

  resources :events do
  	resources :users, only: [:index]
  end


  resources :users
  
  devise_for :users

  get "/login/:code" => "users#login", as: "signin_by_code"

  root to: "users#index"
  
end
