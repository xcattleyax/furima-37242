class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @detail = Detail.new
  end

  def create
    @order = Detail.new(order_params)

    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      @detail = @order
      render 'index'
    end
  end

  private

  def order_params
    params.require(:detail).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: @order.token,
      currency: 'jpy'
    )
  end

end