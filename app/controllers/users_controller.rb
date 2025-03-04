class UsersController < ApplicationController
  before_action :authenticate_user!

  # アカウント設定ページ
  def account
    @user = current_user
  end

  # プロフィール詳細ページ
  def profile
    @user = current_user
  end

  # プロフィール編集ページ
  def edit_profile
    @user = current_user
  end

  # プロフィール更新処理
  def update_profile
    @user = current_user
    if @user.update(profile_params)
      redirect_to profile_users_path, notice: "プロフィールを更新しました。"
    else
      render :edit_profile
    end
  end

  private

  def profile_params
    params.require(:user).permit(:name, :email, :avatar, :bio) # プロフィール用のカラムを追加
  end
end
