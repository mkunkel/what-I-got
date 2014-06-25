class BooksController < ApplicationController
  before_filter :find_collection

  def index
    @books = Book.all
  end

  def create
    @book = @collection.books.new(book_params)
    if @book.save
      redirect_to(action: 'index')
    else
      render 'new'
    end
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find_by_id(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :rating, :collection_id)
  end

  def find_collection
    @collection ||= Collection.find(params[:collection_id])
  end
end
