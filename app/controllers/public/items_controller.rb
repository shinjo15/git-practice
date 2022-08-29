class Public::ItemsController < ApplicationController
  def index
    @genre = Genre.all
    @items = Item.all.page(params[:page]).per(8)
  end
  
  def show
    @genre = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end
end
