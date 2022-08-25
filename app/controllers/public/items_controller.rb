class Public::ItemsController < ApplicationController
  def index
    @genre = Genre.all
    @items = Item.all.page(params[:page]).per(8)
  end
  
  def show
    @genre = Genre.all
    @cart_item = Cart_item.find(params[:id])
    @item = Item.find(params[:id])
  end
  
  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end
end
