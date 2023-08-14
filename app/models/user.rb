class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname,         presence: true
  validates :password,         presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates :family_name_zen,  presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :first_name_zen,   presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :family_name_kana, presence: true, format: {with: /\A[ァ-ヶ一]+\z/}
  validates :first_name_kana,  presence: true, format: {with: /\A[ァ-ヶ一]+\z/}
  validates :birthday,         presence: true

  # has_many :items
  # has_many :orders
end
