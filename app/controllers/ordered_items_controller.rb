class OrderedItemsController < ApplicationController
  before_action :move_to_new, :move_to_top
  before_action :set_item, only: [:index, :create]

  def new
    @itemAddress = ItemAddress.new
  end

  def create
    @itemAddress = ItemAddress.new(order_params)
    if @itemAddress.valid?
      pay_item
      @itemAddress.save
      return redirect_to root_path
    else
      redirect_to item_ordered_items_path
    end
  end

  private

  def move_to_new
    redirect_to controller: 'users/sessions', action: :new unless user_signed_in?
  end

  def move_to_top
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id || @item.ordered_item != nil
      redirect_to root_path
    end
  end

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end