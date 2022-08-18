class Public::CustomersController < ApplicationController
  def show
    @user = current_customer
  end

  def edit
    @user = current_customer
  end

  def update
    @user = current_customer
    if @user.update(customer_params)
      redirect_to customers_my_page_path(@user.id)
    else
      render :edit
    end
  end

  def unsubscribe
     @user = current_customer
    if @user.update(customer_params)
      redirect_to customers_my_page_path(@user.id)
    else
      render :edit
    end
  end

  def withdraw
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_active)
  end

end
