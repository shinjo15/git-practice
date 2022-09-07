class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all.page(params[:page]).per(10)
    @sam = 0
  end
end
