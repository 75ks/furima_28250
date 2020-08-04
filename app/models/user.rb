class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, uniqueness: true

  with_options presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください'} do
    validates :family_name
    validates :first_name
    validates :family_name_kana
    validates :first_name_kana
  end
  
  with_options presence: true do
    validates :name
    validates :family_name
    validates :first_name
    validates :family_name_kana
    validates :first_name_kana
    validates :birthday
  end
end
