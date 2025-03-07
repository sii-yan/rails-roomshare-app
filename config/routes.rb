Rails.application.routes.draw do

  get 'reservations/index'
  get 'reservations/show'
  get 'reservations/edit'
  get 'reservations/confirm'


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
    put "profile", to: "users#update_profile" # PUTメソッドの追加
  end

  # 施設関連
  resources :rooms do
    collection do
      get 'search', to: 'rooms#search' # 施設検索用のルート
      get 'own', to: 'rooms#own' # 登録済ルーム一覧用のルート
    end
  end

  resources :reservations do
    post 'confirm', on: :collection
  end

  root 'home#index'
end

