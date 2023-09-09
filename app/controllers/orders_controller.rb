class OrdersController < ApplicationController

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
      @order_address.save
      redirect_to root_path
    else
      render :index
      
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:post_num, :preference_id, :city, :house_num, :house_name, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end


  #  params.require(:order_address)
  # def order_params
  #   params.permit(:post_num, :prefecture, :city, :house_number, :building_name, :price).merge(user_id: current_user.id)
  # end


end
