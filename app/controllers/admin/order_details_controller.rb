class Admin::OrderDetailsController < ApplicationController
  def update
      @order_item = OrderItem.find(params[:id])
      @order.update
      redirect_to admin_path(@order.id)
  end
end
