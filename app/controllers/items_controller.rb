class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:update,:destroy]
  before_action :item_data,only: [:show,:update,:edit,:destroy]
  before_action :move_to_index, only: [:edit,:destroy,:update]
  before_action :redirect_to_index, only: [:edit,:update]
  
  

  def index
    @items = Item.all.order('created_at DESC')
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

  def search
    @items = Item.search(params[:keyword])
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :overview, :category_id, :quality_id, :delivery_fee_id, :until_date_id, :prefecture_id,
                                 :price, :image).merge(user_id: current_user.id)
  end
  def item_data
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def redirect_to_index
    if current_user.id == @item.user_id && @item.item_log != nil
      redirect_to action: :index
    end
  end
end
