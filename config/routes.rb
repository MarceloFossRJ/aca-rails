AcaRails::Engine.routes.draw do
  resources :users do
    collection { get :versions }
  end

end
