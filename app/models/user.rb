class User < ApplicationRecord
  # deviseの標準モジュール
  devise :database_authenticatable, :registerable,
  　　　　:recoverable, :rememberable, :validatable

  has_many :rooms, dependent: :destory
  has_many :reservations, dependent: :destory
end
