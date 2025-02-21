class User < ApplicationRecord
  # deviseの標準モジュール
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :rooms
  has_many :reservations
end
