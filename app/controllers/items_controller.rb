class ItemsController < ApplicationController
  before_action :move_to_index, only: :new

  def index
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

 private
  def item_params
    params.require(:item)
          .permit(:name, :description, :category_id, :sales_status_id, :fee_status_id, :prefecture_id, :scheduled_delivery_id, :price, :image)
          .merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to :index
    end
end
