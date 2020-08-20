class OrderedItemsController < ApplicationController
  before_action :move_to_new

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @itemAddress = ItemAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
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

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_57adef012cb2e2e407d964bb"
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )
  end
end