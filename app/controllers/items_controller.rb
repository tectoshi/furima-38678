class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :ordered_item, only: :edit
  
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
  end
  
  def edit
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user.id
      @item.destroy  
    end
    redirect_to root_path
  end

 private
  def item_params
    params.require(:item)
          .permit(:name, :description, :category_id, :sales_status_id, :fee_status_id, :prefecture_id, :scheduled_delivery_id, :price, :image)
          .merge(user_id: current_user.id)
  end

  def ordered_item
      if current_user.id == @item.user.id && @item.order.present?
        redirect_to root_path
      end 
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
