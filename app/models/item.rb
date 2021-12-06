class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :salesStatus
  belongs_to :shippingFee
  belongs_to :prefecture
  belongs_to :scheduledDelivery
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :info
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :sales_status_id
      validates :shipping_fee_id
      validates :prefecture_id
      validates :scheduled_delivery_id
    end
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image, presence: true
end
