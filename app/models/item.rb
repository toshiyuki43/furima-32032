class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :shipping_day
  belongs_to :item_condition


  with_options presence: true do
    validates :title
    validates :text
    validates :category_id
    validates :item_condition_id
    validates :shipping_charge_id
    validates :shipping_day_id
    validates :prefecture_id
    validates :image
    validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :shipping_day_id
  end
end
