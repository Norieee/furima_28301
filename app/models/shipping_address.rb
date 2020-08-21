class ShippingAddress < ApplicationRecord
  belongs_to :ordered_item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end