class Admin::OrdersController < 
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_path(@order.id)
    else
      render :edit
    end
  end
  
  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :postal_code, :address, :payment_method, :order_status, :postage, :payment_amount)
  end
end
