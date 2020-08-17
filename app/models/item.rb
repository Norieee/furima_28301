class Item < ApplicationRecord
  belongs_to :user
  has_one :ordered_item
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_until_shipping

  with_options presence: true do
    validates :image, :name, :explanation
    validates :price,
              numericality: { with: /\A[0-9]+\z/, message: 'is not half-width numbers' },
              numericality: { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999,
                              message: 'is out of the setting range' }
    validates :category_id, :status_id, :shipping_charge_id,
              :prefecture_id, :days_until_shipping_id,
              numericality: { greater_than_or_equal_to: 1, allow_blank: true}
  end
end
