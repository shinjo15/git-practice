class Order < ApplicationRecord
  has_many :order_items
  belongs_to :customer
  
  enum order_status: { waiting_for_payment: 0, payment_confirmation: 1, production: 2, preparing_to_ship: 3, sent: 4 }
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end
  
  def order_status_display
    if order_status == 0
      入金待ち
    elsif order_status == 1
      入金確認
    elsif order_status == 2
      制作中
    elsif order_status == 3
      発送準備中
    else
      発送済み
    end
  end
end
