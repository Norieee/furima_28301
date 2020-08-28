class UsersController < ApplicationController
  def show
    @displayed = current_user.items.order("created_at DESC")
    @items = Item.all
    @user_ordered = OrderedItem.where(user_id: current_user.id)
    @ordered_ids = @user_ordered.pluck(:item_id)
    @ordered_items = @items.where(id: @ordered_ids)
  end
end
