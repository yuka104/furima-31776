class User < ApplicationRecord
  has_many :items
  has_many :parchases

  with_options presence: true do
    validates :nickname
    validates :birthday

    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
    with_options format: { with:NAME_REGEX } do
      validates :family_name
      validates :first_name
    end

    KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/
    with_options format: { with:KATAKANA_REGEX } do
    validates :family_name_kana
    validates :first_name_kana
    end
  end
  
  validates :email, uniqueness: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze }
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
