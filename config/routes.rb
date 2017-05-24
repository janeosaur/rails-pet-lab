Rails.application.routes.draw do

  root "site#index"

  resources :owners do
    resources :pets
  end

  resources :pets, only: [:show, :edit, :update, :destroy] do
    resources :appointments, only: [:new, :create]
  end

  get "/signup" => "owners#new"
  post "/owners" => "owners#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

end
