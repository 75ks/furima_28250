class Address < ApplicationRecord
  belongs_to_active_hash :area
  belongs_to :item

  with_options presence: true do
    validates :post_code
    validates :area_id
    validates :city
    validates :house_number
    validates :phone_number
    validates :item
  end
end
