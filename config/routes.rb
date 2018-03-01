Rails.application.routes.draw do
  
  root "users#index"
  resources :users
  resources :spots
  resources :sessions, only: [:new, :create]

  get "/about" => "pages#about"
  
  delete "/logout" => "sessions#destroy", as: :logout

end
