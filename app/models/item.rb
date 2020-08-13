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

  #空の投稿を保存できないようにする
  validates :name, :explanation, :category_id, :status_id, :shipping_charges_id,
            :prefecture_id, :days_until_shipping_id, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, :shipping_charges_id,
            :prefecture_id, :days_until_shipping_id, numericality: { other_than: 1 } 
end
