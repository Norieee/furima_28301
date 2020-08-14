class ItemsController < ApplicationController
  before_action :move_to_new, except: [:index]

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
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :shipping_charges_id, :prefecture_id, :days_until_shipping_id, :price).merge(user_id: current_user.id)
  end

  def move_to_new
    unless user_signed_in?
      redirect_to controller: 'users/sessions', action: :new
    end
  end
end
