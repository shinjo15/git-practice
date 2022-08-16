class Order < ApplicationRecord
  has_many :order_item
  belongs_to :customer
  
  enum order_status: { waiting_for_payment: 0, payment_confirmation: 1, production: 2, preparing_to_ship: 3, sent: 4 }
  enum payment_method: { credit_card: 0, transfer: 1 }
end
