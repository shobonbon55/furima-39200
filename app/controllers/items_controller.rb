class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :move_to_index, except: [:index, :new, :create]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    
    if @item.save
      redirect_to root_path
    else
       render :new
     end
    end


  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :courier_fare_id, :send_area_id, :send_period_id, :price, :image).merge(user_id: current_user.id)
  end
  
  def move_to_index
    if user_signed_in?
      @item = Item.find(params[:id])
      unless current_user == @item.user
        redirect_to action: :index
      end
    end
  end
end
