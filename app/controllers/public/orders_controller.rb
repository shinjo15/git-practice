class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.new
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }.to_i
    @order = Order.new(order_params)
    @payment_method = params[:order][:payment_method]
    @address_select = params[:order][:address_select]
    if @address_select == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name+current_customer.last_name
    elsif  @address_select == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      @address.customer_id = current_customer.id
      @address.save!
    end

  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.save!
    redirect_to orders_complete_path
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :postal_code, :address, :name, :postage, :payment_amount)
  end
end
