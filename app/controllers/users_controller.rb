class UsersController < ApplicationController
  def show
    @displayed = current_user.items.order("created_at DESC")
    @items = Item.all
    @user_ordered = OrderedItem.where(user_id: current_user.id)
    @ordered_ids = @user_ordered.pluck(:item_id)
    @ordered_items = @items.where(id: @ordered_ids)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
