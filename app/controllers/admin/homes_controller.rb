class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
    @sam = 0
  end
end
