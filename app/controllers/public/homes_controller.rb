class Public::HomesController < ApplicationController
  def top
    @genre = Genre.all
    @items = Item.order(created_at: :DESC).limit(4)
  end
  
  def about
  end
end
