class BooksController < ApplicationController
  before_filter :find_collection

  def index
    @books = Book.all
  end

  def create
    @book = @collection.books.new(book_params) # add @ if it doesn't
    if @book.save
      redirect_to(action: "index")
    else
      render 'new'
    end
    request = Amazon.new
    params = {
     'SearchIndex' => 'Books',
     'Keywords'    => 'Architecture'
    }
    res = request.item_search(query: params)
  end

  def new
    @book = Book.new
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :rating, :collection_id)
  end

  def find_collection
    @collection ||= Collection.find(params[:collection_id])
  end
end
