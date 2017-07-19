AcaRails::Engine.routes.draw do

  root :to => "home#index"
  get '/home/index'
  get '/locked' => 'home#locked'

  get "/logout" => "sessions#destroy", :as => "logout"
  get "/login" => "sessions#new", :as => "login"
  post "/login" => "sessions#create"

  resources :users do
    collection { get :versions }
  end
  get 'users/:id/version' => 'users#version', as: :version_user

  resources :changepwds
  resources :my_profile
  resources :inactivate
  resources :password_resets

  get '/signup' => 'signup#new'
  post '/signup' => 'signup#create'
  get '/signup/:id/edit' => 'signup#edit', as: :confirm_email
  put '/signup/:id' => 'signup#update'
  patch '/signup/:id' => 'signup#update'

  get "/401", to: "errors#unauthorized"
  get "/403", to: "errors#forbidden"
  get "/404", to: "errors#not_found"
  get "/405", to: "errors#method_not_allowed"
  get "/500", to: "errors#server_error"

end
