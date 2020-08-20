class ItemAddress

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id,
                :city, :address, :building, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ , message: 'input correctly' }
    validates :prefecture_id, numericality: { greater_than_or_equal_to: 1, allow_blank: true }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :city, :address
  end

  def save
    orderedItem = OrderedItem.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(
      postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address,
      building: building, phone_number: phone_number, ordered_item_id: orderedItem.id
    )
  end

end