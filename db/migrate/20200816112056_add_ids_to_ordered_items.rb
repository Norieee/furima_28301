class AddIdsToOrderedItems < ActiveRecord::Migration[6.0]
  def change
    add_column :ordered_items, :item_id, :integer
    add_column :ordered_items, :user_id, :integer
  end
end
