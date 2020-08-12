class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :shipping_chages_id, :days_until_shipping_id, :price).merge(user_id: current_user.id)
  end
end
