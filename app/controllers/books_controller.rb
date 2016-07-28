class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)

    if @book.save
      flash[:notice] = "Book was saved successfully."
      redirect_to @book
    else
      flash.now[:alert] = "There was an error saving your book. Please try again."
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.assign_attributes(book_params)

    if @book.save
      flash[:notice] = "Book was saved successfully."
      redirect_to @book
    else
      flash.now[:alert] = "There was an error saving your book. Please try again."
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])

    if @book.destroy
      flash[:notice] = "\"#{@book.title}\" was deleted successfully."
      redirect_to books_path
    else
      flash.now[:alert] = "There was an error deleting the book."
      render :show
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :rating, :notes)
  end
end
