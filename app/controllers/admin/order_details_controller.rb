class Admin::OrderDetailsController < ApplicationController
  def update
      @order_item = Order.find(params[:id])
      @order_item.update
      redirect_to admin_path(@order.id)
  end
end
