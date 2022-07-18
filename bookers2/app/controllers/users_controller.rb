class UsersController < ApplicationController
   before_action :corrent_user, only: [:edit, :update]
   
  def index
    @users = User.all
    @user = current_user
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
     redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
     render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def corrent_user
    @bookfind = Book.find(params[:id])
    @user = @bookfind.user
    redirect_to(books_path) unless @user == current_user
  end
  
end
