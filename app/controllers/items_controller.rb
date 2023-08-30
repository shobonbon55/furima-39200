class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :new, :create, :show]
  before_action :find, except: [:show, :edit, :update]

  def index
    @items = Item.order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
       if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
   end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :courier_fare_id, :send_area_id, :send_period_id, :price, :image).merge(user_id: current_user.id)
  end

  def find
    @item = Item.find(params[:id])
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
