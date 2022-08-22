class Public::AddressesController < ApplicationController
  def index
    @address_new = Address.new
    @address = Address.all
  end
  
  def edit
  end
  
  def create
    @address_new = Address.new(address_params)
    @address_new.save
    redirect_to addresses_path
  end
  
  def update
  end
  
  def destroy
  end
  
   private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name )
  end
  
end
