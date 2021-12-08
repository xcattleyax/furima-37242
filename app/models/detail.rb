class Detail
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :addresses
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "(-)を入れず10桁もしくは11桁で入力してください"}
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    OrderDetail.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end
