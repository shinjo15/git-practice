class UsersController < ApplicationController
  def index
  end
  
  def show
    @user = params()
    @books = @user.books
  end

  def edit
  end
end
