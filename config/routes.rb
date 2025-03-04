Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }, path: '', path_names: {
    sign_up: 'signup',
    sign_in: 'login',
    sign_out: 'logout',
    edit: 'account/edit'
  }

  # アカウント設定・プロフィール関連のルート
  resource :users, only: [] do
    get "account"
    get "profile"
    get "profile/edit", to: "users#edit_profile"
    patch "profile", to: "users#update_profile", as: "update_profile"
  end

  # resources :users, only: [:show, :edit, :update] # ユーザー詳細・編集
  resources :rooms
  resources :reservations

  root 'home#index'
end

