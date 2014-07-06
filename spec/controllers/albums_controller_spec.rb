require 'rails_helper'

describe AlbumsController, :type => :controller do

  describe "DELETE 'destroy'" do
    let(:album) { Fabricate(:album) }
    it "destroys an album" do
      delete 'destroy', id: album.id, collection_id: album.collection

      expect(Album.count).to eq(0)
    end
  end

end
