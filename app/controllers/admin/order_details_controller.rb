class Admin::OrderDetailsController < ApplicationController
  def update
      @order = Order.find(params[:id])
      @order_item = OrderItem.find(params[:id])
      if @order_item.production_status == 2
        @order.update(order_status: "production")
      elsif @order_item.production_status == 3
        @order.update(order_status: "preparing_to_ship")
      end
      @order_item.update(order_item_params)
      redirect_to admin_path
  end

  private

  def order_item_params
    params.require(:order_item).permit(:production_status)
  end
end
