require 'rails_helper'

describe BooksController, :type => :controller do
  let(:book) { Fabricate(:book) }

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', collection_id: book.collection
      expect(response).to be_success
    end
  end

  describe "DELETE 'destroy'" do
    it "destroys an book" do
      delete 'destroy', id: book.id, collection_id: book.collection
      expect(Book.count).to eq(0)
    end
  end

end
