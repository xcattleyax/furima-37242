class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'アルファベット、数字の両方を使用してください' } do
    validates :password
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]/, message: '全角で入力してください' } do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶ--]+\z/, message: '全角カタカナで入力してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end
  validates :birthday, presence: true
end
