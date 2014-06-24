class BooksController < ApplicationController

  def index
    @books = Book.all
    @collection = Collection.find(params[:id])
  end

  def create
    collection = Collection.find(params[:id])
    @book = collection.books.new(book_params) # add @ if it doesn't
    if @book.save
      redirect_to(action: "index")
    else
      render 'new'
    end
  end

  def new
    @collection = Collection.find(params[:id])
    @book = Book.new
  end

 private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :rating, :collection_id)
  end
end
