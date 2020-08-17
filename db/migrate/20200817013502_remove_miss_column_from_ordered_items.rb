class RemoveMissColumnFromOrderedItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :ordered_items, :item_id, :string
    remove_column :ordered_items, :user_id, :string
    add_reference :ordered_items, :item, foreign_key: true
    add_reference :ordered_items, :user, foreign_key: true
  end
end