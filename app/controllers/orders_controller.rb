class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item_data, only: [:index,:create]
  before_action :move_to_index, only: [:index]

  def index
    @purchase_form = PurchaseForm.new

  end


  def create
    @purchase_form = PurchaseForm.new(item_log_params)   
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def item_data
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.item_log != nil
      redirect_to root_path
    end
  end
  
  def item_log_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,  
      card: @purchase_form.token,    
      currency: 'jpy'                 
    )
  end
  
end
