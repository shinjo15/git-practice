class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
  end
  
  def show
    @user = current_user
    @book = Book.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = current_user
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
