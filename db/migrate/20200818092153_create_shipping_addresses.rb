class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :postal_code,    null: false
      t.integer :prefecture_id, null: false
      t.integer :city,          null: false
      t.integer :address,       null: false
      t.integer :building
      t.integer :phone_number,  null: false
      t.timestamps
    end
  end
end
