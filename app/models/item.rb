class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :state
  belongs_to :delivery_day
  belongs_to :fee

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 } 
    validates :condition_id, numericality: { other_than: 1 } 
    validates :price
    validates :state_id, numericality: { other_than: 1 } 
    validates :delivery_days_id, numericality: { other_than: 1 } 
    validates :fee_id, numericality: { other_than: 1 } 
  end
  validates :user, foreign_key: true
  belongs_to :user
end
