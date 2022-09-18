class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @name = @order.customer.last_name+@order.customer.first_name
  end

  def update
    @order = Order.find(params[:id])
    if @order.order_status == "payment_confirmation"
      @order.order_items.update(production_status: 1)
    end
    @order.update(order_params)
    redirect_to admin_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :postal_code, :address, :payment_method, :order_status, :postage, :payment_amount)
  end
end
