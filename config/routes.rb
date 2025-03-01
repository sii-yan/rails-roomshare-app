Rails.application.routes.draw do

  root 'home#index'

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  resources :users, only: [:show, :edit, :update] # ユーザー詳細・編集
  resources :rooms
  resources :reservations
  

  # ユーザーのアカウント設定とプロフィールに関するルーティング
  resource :account, only: [:show, :edit, :update], controller: 'accounts'
  resource :profile, only: [:show, :edit, :update], controller: 'profiles'

  get "dashboard", to: "dashboard#index"
end
