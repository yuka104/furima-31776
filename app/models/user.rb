class User < ApplicationRecord

  with_options presence: true do
    validates :nickname
    validates :birthday

    with_options format: { with:NAJME_REGEX } do
      NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
      validates :family_name
      validates :first_name
    end

    with_options format: { with:KATAKANA_REGEX } do
    KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/
    validates :family_name_kana
    validates :first_name_kana
    end
  end
  
  validates :email, uniqueness: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze }
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
