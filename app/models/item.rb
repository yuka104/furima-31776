class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :state


  with_options presence: true do
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 } 
    validates :condition_id, numericality: { other_than: 1 } 
    validates :price
    validates :state_id
    validates :delivery_days_id
    validates :fee_id
  end
  validates :user, foreign_key: true
  belongs_to :user
end
