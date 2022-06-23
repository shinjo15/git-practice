class BooksController < ApplicationController
  def new
  end

  def index
    @books = Book.new
    @lists = Book.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id), notice: "Book was successfully created."
    else
      @lists = Book.all
      render :index
    end
  end


  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.save
     redirect_to book_path(@book.id), notice: "Book was successfully updated."
    else
      @book = Book.find(params[:id])
      render :show
    end
  end

  def destroy
   book = Book.find(params[:id])
   book.destroy
   redirect_to books_path
  end

  private

  def book_params
    params.permit(:title, :body)
  end
end
