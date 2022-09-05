class Order < ApplicationRecord
  has_many :order_items
  belongs_to :customer
  
  enum order_status: { waiting_for_payment: 0, payment_confirmation: 1, production: 2, preparing_to_ship: 3, sent: 4 }
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end
  
  def order_status_display
    if order_status == 'waiting_for_payment'
      '入金待ち'
    elsif order_status == 'payment_confirmation'
      '入金確認'
    elsif order_status == 'production'
      '制作中'
    elsif order_status == 'preparing_to_ship'
      '発送準備中'
    else
      '発送済み'
    end
  end
  
  def payment_method_display
    if order_status == 'credit_card'
      Order.payment_methods_i18n[:credit_card]
    else
      Order.payment_methods_i18n[:transfer]
    end
  end
end
