class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def create
    @book = @collection.books.new(book_params)
    if @book.save
      redirect_to(action: :index)
    else
      render :new
    end
  end

  def new
    @book = Book.new
  end

  def show
    book
  end

  def delete
    book
  end

  def destroy
    book.destroy
    flash[:notice] = "#{@book.title} was deleted successfully."
    redirect_to(action: :index)
  end

  private

  def book
    @book ||= Book.find_by_id(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :genre, :rating, :collection_id, :id)
  end
end
