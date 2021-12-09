class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root, only: [:index]

  def index
    @detail = Detail.new
  end

  def create
    @order = Detail.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      @detail = @order
      render 'index'
    end
  end

  private

  def order_params
    params.require(:detail).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: @order.token,
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    redirect_to root_path unless current_user.id != @item.user_id && Order.pluck('item_id').include?(@item.id) == false
  end
end
