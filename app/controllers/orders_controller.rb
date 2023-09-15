class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index, :new, :create]
  
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])

  end

  def new
    @order_address = OrderAddress.new
  end

  def create
     @order_address = OrderAddress.new(order_params)
    item_id = params[:item_id]
    @item = Item.find(item_id)

    if @order_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,        # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )

      @order_address.save
      redirect_to root_path
    else
      render :index
      
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:post_num, :preference_id, :city, :house_num, :house_name, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    item_id = params[:item_id]
    @item = Item.find(item_id)
    unless  @item.order.present? || user_signed_in?
      redirect_to new_user_session_path and return
    end
      if current_user == @item.user  
         redirect_to root_path  and return
            end
     end 
  end
