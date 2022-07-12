class RemoveShopNameFromPostImages < ActiveRecord::Migration[6.1]
  def change
    remove_column :post_images, :shop_name, :string
  end
end
