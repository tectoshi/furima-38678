class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_address_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_address_params
    params.require(:order_address)
    .permit(:postal_code, :prefecture_id, :city, :addresses, :phone_number, :building)
    .merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
