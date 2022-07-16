class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create 
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end
  
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end
  
  def show
    @book = Book.new
    @bookfind = Book.find(params[:id])
    @user = current_user
  end
  
  def edit
    @bookfind = Book.find(params[:id])
  end
  
  def update
    @bookfind = Book.find(params[:id])
    @bookfind.update(book_params)
    redirect_to book_path(@bookfind.id)
  end
  
  def destroy
    @bookfind = Book.find(params[:id])
    @bookfind.destroy
    redirect_to books_path
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
