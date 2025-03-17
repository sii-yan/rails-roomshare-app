# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?


  # アカウント更新処理をオーバーライド
  def update
    @user = current_user


    # パスワード変更をする場合
    if @user.update_with_password(account_update_params)
      bypass_sign_in(@user) # 更新後にログイン維持
      redirect_to account_users_path, notice: "アカウント情報を更新しました。"
    else
      render :edit
    end
  end


  private

  # Deviseのデフォルトでは name を登録できないことを解決するためのカスタマイズ
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end

end