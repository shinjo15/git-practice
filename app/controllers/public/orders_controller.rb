class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.new
  end
  
  def confirm
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
    params.require(:order).permit(:customer_id, :name, :postal_code, :address, :payment_method, :order_status, :postage,:payment_amount)
  end
end
