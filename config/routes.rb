Rails.application.routes.draw do
  resources :expenses
  resources :expense_types
  resources :maintenances
  resources :consumptions
  resources :intervention_types
  resources :maintenance_types
  resources :vehicle_models
  resources :odometers
  resources :shiftings
  resources :vehicle_stickers
  resources :sites
  resources :technical_visits
  resources :insurances
  resources :insurers
  resources :incidents
  resources :parks
  resources :vehicles
  resources :vehicle_brands
  resources :vehicle_types
  resources :profiles
  #devise_for :users
  resources :permission_items
  resources :permissions
  resources :features
  resources :roles
  #root to: "front#home"
  get "/dashboard" => "dashboard#index", as: :dashboard
  resources :profiles do   
    get "delete" 
  end
  resources :permission_items do   
    get "delete" 
  end
  resources :permissions do   
    get "delete" 
  end
  resources :features do   
    get "delete" 
  end
  resources :roles do   
    get "delete" 
  end

  scope "account" do 
    resources :profiles 
    get "profile/:uid" => "profiles#edit", as: :edit_account
  end

  
  

  	get "/users"     => "custom_users#index", as: :all_users 
  	get "/user/enable/:id" => "custom_users#get_enable", as: :get_enable_user_account
	post "/user/enable/:id" => "custom_users#post_enable", as: :post_enable_user_account
	get "/user/disable/:id" => "custom_users#get_disable", as: :get_disable_user_account
	post "/user/disable/:id" => "custom_users#post_disable", as: :post_disable_user_account


  devise_for :users, path: '', controllers: { 
    registrations: "users/registrations",
    confirmations: 'users/confirmations',
    passwords: "users/passwords",
    sessions: "users/sessions"
        
    }, 
    path_names: {
        sign_in: 'login', 
        sign_out: 'logout', 
        password: 'secret', 
        confirmation: 'verification', 
        unlock: 'unblock', 
        registration: 'signup', 
        sign_up: '' 
    }
   
    devise_scope :user do
      root to: "users/sessions#new"
      authenticated :user do
        root 'dashboard#index', as: :authenticated_root
      end
  
      unauthenticated do
        root 'users/sessions#new', as: :unauthenticated_root
      end
    end


    # Dynamic error pages
    get "/404", to: "errors#not_found"
    get "/422", to: "errors#unacceptable"
    get "/500", to: "errors#internal_error"

    mount Ckeditor::Engine => '/ckeditor'
  # For mobile API Endpoint
  mount API::Base, at: "/"
end
