class AddBodyToPostImages < ActiveRecord::Migration[6.1]
  def change
    add_column :post_images, :body, :text
  end
end
