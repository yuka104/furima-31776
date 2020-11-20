class PurchaseAddress
  include ActiveModel::Model
  attr_accessor  :user, :item, :postal_code, :state_id, :city, :block_number, :building, :phone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :block_number
    validates :phone_number, format: {with: /\A\d{11}\z/, message: "can't be blank" }
    validates :state_id, numericality: { other_than:1, message: "can't be blank" }
  end
  
  def save
    purchase = Purchase.create(user: user.id, item: item.id)
    Address.create(postal_code: postal_code, state_id: state_id, city: city, block_number: block_number, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end