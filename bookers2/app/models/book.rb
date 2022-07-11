class Book < ApplicationRecord
  belongs_to :user
end
  
  def change
    create_table :books do |t|
      t.string :title
      t.text :body
      t.integer :user_id
  end
end
