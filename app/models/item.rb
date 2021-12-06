class Item < ApplicationRecord

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :SalsesStatus
  belongs_to :ShippingFee
  belongs_to :Prefecture
  belongs_to :ScheduledDelivery
end
