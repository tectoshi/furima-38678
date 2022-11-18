class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable         
  
  validates :nickname, presence: true
  validates :last_name, presence: true
  #format:{ with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Last name is invalid. Input full-width characters' }
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  #format: {with:  /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,message: "全角カタカナのみで入力して下さい"}
  
  validates :first_name_kana, presence: true
  validates :date_of_birth, presence: true


end
