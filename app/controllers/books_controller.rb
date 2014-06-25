class BooksController < ApplicationController
  before_filter :find_collection

  def index
    @books = Book.all
    # @collection = Collection.find(params[:id])
  end

  def create
    @collection = Collection.find(params[:collection_id])
    @book = @collection.books.new(book_params)
    if @book.save
      redirect_to(action: "index")
    else
      render 'new'
    end
  end

  def new
    # @collection = Collection.find(params[:id])
    @book = Books.new
  end

 private

  def find_collection
    @collection ||= Collection.find(params[:collection_id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :genre, :rating, :collection_id)
  end
end
