Rails.application.routes.draw do
  resources :users
  mount AcaRails::Engine => "/aca_rails"
end
