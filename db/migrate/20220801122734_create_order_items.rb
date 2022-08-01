class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :order_id, null: false
      integer :item_id, null: false
      integer :purchase_price, null: false
      integer :amount, null: false
      integer :production_status, null: false

      t.timestamps
    end
  end
end
