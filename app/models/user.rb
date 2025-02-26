class User < ApplicationRecord
  # deviseの標準モジュール
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 50 }
  validates :bio, length: { maximum: 200 }

  has_many :rooms
  has_many :reservations
end
