class ChangeColumnToItem < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:items, :is_active, true)
  end
end
