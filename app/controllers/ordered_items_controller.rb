class OrderedItemsController < ApplicationController
  before_action :move_to_new

  def index
    @item = Item.find(params[:item_id])
  end

  private

  def move_to_new
    redirect_to controller: 'users/sessions', action: :new unless user_signed_in?
  end
end