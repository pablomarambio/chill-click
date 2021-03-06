ChillClick::Application.routes.draw do

	resources :events do
		member do
			get 'browse_attendees'
			post 'vote'
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

	get "/login/:auth_code" => "users#login", as: "signin_by_code"
	delete "/logout" => "users#logout", as: "logout_user"

	root to: "events#public_index"
	
end
