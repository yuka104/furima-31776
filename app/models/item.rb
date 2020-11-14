class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :price
    validates :state_id
    validates :delivery_days_id
    validates :fee_id
  end
  
  validates :user, foreign_key: true
end
