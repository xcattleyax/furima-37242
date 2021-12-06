class Item < ApplicationRecord

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :SalsesStatus
  belongs_to :ShippingFee
  belongs_to :Prefecture
  belongs_to :ScheduledDelivery
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :info
    with_options numericality: { other_than: 1 , message: "can't be blank"} do
      validates :genre_id
      validates :SalsesStatus
      validates :ShippingFee
      validates :Prefecture
      validates :ScheduledDelivery
    end
    with_options numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9,999,999}, format:{ with: /^[0-9]*$/, message: '半角で入力してください' } do
    validates :price
    end
  end
  
end
