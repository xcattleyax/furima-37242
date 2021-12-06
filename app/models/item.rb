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
      validates :SalesStatus
      validates :ShippingFee
      validates :Prefecture
      validates :ScheduledDelivery
    end
    with_options format:{ with: /\A[0-9]+\z/i, message: '半角で入力してください' } do
      validates :price,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    end
  end
  
end
