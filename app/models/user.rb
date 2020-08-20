class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :sns_credentials

  validates :email, uniqueness: true

  half_width_alphanumeric = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
  validates :password, presence: true, format: { with: half_width_alphanumeric, message: 'に半角英数字を使用してください' }

  full_width_character = /\A[ぁ-んァ-ン一-龥]/
  with_options presence: true, format: { with: full_width_character, message: 'に全角文字を使用してください' } do
    validates :family_name
    validates :first_name
  end

  full_width_kana = /\A[ァ-ンー－]/
  with_options presence: true, format: { with: full_width_kana, message: 'に全角カタカナを使用してください' } do
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

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      name: auth.info.name,
        email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
