class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customers
end
