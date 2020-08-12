class Item < ApplicationRecord
  belongs_to :user
  has_one :ordered_item
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :shipping_charges,
                         :prefecture, :days_until_shipping

  #空の投稿を保存できないようにする
  validates :name, :explanation, :category, :status, :shipping_charges,
            :prefecture, :days_until_shipping, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, :shipping_charges_id,
            :prefecture, :days_until_shipping, numericality: { other_than: 1 } 
end
