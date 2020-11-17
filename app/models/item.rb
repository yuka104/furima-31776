class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :state
  belongs_to :delivery_days
  belongs_to :fee

  with_options presence: true do
    validates :name
    validates :description
    validates :image

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :state_id
      validates :delivery_days_id
      validates :fee_id
    end

  validates :price, numericality: { greater_than: 300, less_than: 10000000 }
  end
end
