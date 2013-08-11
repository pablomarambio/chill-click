ChillClick::Application.routes.draw do

	resources :events do
		member do
			get 'browse_attendees'
		end
		resources :users, only: [:index, :new, :create] do
			member do
				get 'link'
			end
		end
	end

	resources :users do
		collection do
			get :query
		end
	end
	
	devise_for :users

	get "/login/:code" => "users#login", as: "signin_by_code"

	root to: "users#index"
	
end
