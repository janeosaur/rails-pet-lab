Rails.application.routes.draw do

  root "site#index"

  resources :owners do
    resources :pets
  end

  resources :pets, only: [:show, :edit, :update, :destroy] do
    resources :appointments, only: [:new, :create]
  end

end
