Rails.application.routes.draw do
  get 'rooms/index'
  get 'rooms/new'
  get 'rooms/create'
  get 'rooms/edit'
  get 'rooms/update'
  get 'rooms/destory'
  root 'home#index'
  devise_for :users

  resources :rooms
  resources :reservations
end
