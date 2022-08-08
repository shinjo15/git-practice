class Item < ApplicationRecord
  has_one_attached :image
  enum is_active: {sale: 0, selling_discontinued: 1 }
  belongs_to :genre
end
