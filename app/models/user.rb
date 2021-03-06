class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '半角のアルファベット、数字の両方を使用してください' } do
      validates :password
    end
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]/, message: '全角で入力してください' } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶ-ー]+\z/, message: '全角カタカナで入力してください' } do
      validates :last_name_kana
      validates :first_name_kana
    end
    validates :birthday
  end
end
