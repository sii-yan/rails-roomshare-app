Rails.application.routes.draw do
  resources :homes
  root 'rooms#index'

  devise_for :users
end
