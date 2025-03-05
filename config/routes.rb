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

  # アカウント設定・プロフィール関連
  resource :users, only: [] do
    get "account"
    get "profile"
    get "profile/edit", to: "users#edit_profile"
    patch "profile", to: "users#update_profile", as: "update_profile"
  end

  # 施設関連
  resources :rooms do
    collection do
      get 'search', to: 'rooms#search' # 施設検索用のルート
    end
  end

  resources :reservations

  root 'home#index'
end

