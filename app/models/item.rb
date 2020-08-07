class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :area
  belongs_to_active_hash :preparation_day
  belongs_to             :user
  has_one_attached       :image

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_condition_id
    validates :postage_payer_id
    validates :area_id
    validates :preparation_day_id
  end

  with_options presence: true do
    validates :name
    validates :image
    validates :price
    validates :introduction
    validates :category_id
    validates :item_condition_id
    validates :postage_payer_id
    validates :area_id
    validates :preparation_day_id
    validates :user
  end
end
