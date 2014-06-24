class BooksController < ApplicationController

  def index
    @books = Book.all
  end
  
 private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :rating, :collection_id)
  end
end
