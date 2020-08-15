class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :post_code, :area_id, :city, :house_number, :building_name, :phone_number

  # Orderモデルのバリデーション
  with_options presence: true do
    validates :user_id
    validates :item_id
  end

  # Addressモデルのバリデーション
  post_code = /\A\d{3}[-]\d{4}\z/
  validates :post_code, presence:true, format: { with: post_code, message: 'ハイフンを使用してください'}

  phone_number = /\A\d{1,11}\z/
  validates :phone_number, presence:true, format: { with: phone_number, message: '11桁以内でハイフンは使用しないでください'}

  with_options presence: true do
    validates :post_code
    validates :area_id
    validates :city
    validates :house_number
    validates :phone_number
    validates :item_id
  end

  def save
    Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, area_id: area_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, item_id: item_id)
  end
end