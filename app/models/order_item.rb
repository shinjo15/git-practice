class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  def sum_of_price
    item.taxin_price * amount
  end 
end