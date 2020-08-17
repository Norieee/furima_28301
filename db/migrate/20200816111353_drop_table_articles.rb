class DropTableArticles < ActiveRecord::Migration[6.0]
  def change
    drop_table :orderd_items
  end
end
