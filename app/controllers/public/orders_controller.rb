class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.new
  end
  
  def confirm
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
  end
  
  def complete
  end
  
  def create
    @order = Order.new(order_params)
    @address.customer_id = current_customer.id
    @address.save!
    redirect_to orders_confirm_path
  end
  
  def index
  end
  
  def show
  end
  
  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage)
  end
end
