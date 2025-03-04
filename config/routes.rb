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


  resources :rooms do
    collection do
      get 'search'  # 施設検索用のルート
    end
  end

  resources :reservations

  root 'home#index'
end

