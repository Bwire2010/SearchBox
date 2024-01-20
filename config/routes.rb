Rails.application.routes.draw do
  resources :searches, only: [:index, :create]

  root 'searches#index'
end
