class ItemsController < ApplicationController
  before_action :move_to_new, except: [:index]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :shipping_charge_id, :prefecture_id, :days_until_shipping_id, :price).merge(user_id: current_user.id)
  end

  def move_to_new
    redirect_to controller: 'users/sessions', action: :new unless user_signed_in?
  end
end
