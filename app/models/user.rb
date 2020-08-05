class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true

  half_width_alphanumeric = '\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z'
  validates :password, presence: true, format: { with: /#{half_width_alphanumeric}/i, message: '半角英数字を使用してください' }

  full_width_character = '\A[ぁ-んァ-ン一-龥]'
  with_options presence: true, format: { with: /#{full_width_character}/, message: '全角文字を使用してください' } do
    validates :family_name
    validates :first_name
  end

  full_width_kana = '\A[ァ-ンー－]'
  with_options presence: true, format: { with: /#{full_width_kana}/, message: '全角カタカナを使用してください' } do
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
