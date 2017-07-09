AcaRails::Engine.routes.draw do

  root :to => "home#index"
  get 'home/index'

  post "/logout" => "sessions#destroy", :as => "logout"
  get "/login" => "sessions#new", :as => "login"
  post "/login" => "sessions#create"


  resources :users do
    collection { get :versions }
  end

  resources :changepwds

  resources :my_profile
end
