class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: :edit
  
  def index
    @items = Item.all.order(created_at: :desc)
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
  def show
    @item = Item.find(params[:id])
  end
  def edit
    @item = Item.find(params[:id])
  end
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end


 private
  def item_params
    params.require(:item)
          .permit(:name, :description, :category_id, :sales_status_id, :fee_status_id, :prefecture_id, :scheduled_delivery_id, :price, :image)
          .merge(user_id: current_user.id)
  end
  def move_to_index
    if current_user.id != params[:user_id]
      redirect_to root_path
    end
  end
  
end
