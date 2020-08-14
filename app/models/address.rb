class Address < ApplicationRecord
  belongs_to_active_hash :area
  belongs_to :item

  post_code = /\A\d{3}[-]\d{4}\z/
  validates :post_code, presence:true, format: { with: post_code, message: 'ハイフンを使用してください'}

  phone_number = /\A\d{1, 11}\z/
  validates :phone_number, presence:true, format: { with: phone_number, message: '11桁以内でハイフンは使用しないでください'}

  with_options presence: true do
    validates :post_code
    validates :area_id
    validates :city
    validates :house_number
    validates :phone_number
    validates :item
  end
end
