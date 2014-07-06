require 'rails_helper'

describe CollectionsController, :type => :controller do
  let(:collection) { Fabricate(:collection) }

  describe "DELETE 'destroy'" do
    it "destroys an collection" do
      delete 'destroy', id: collection.id

      expect(Collection.count).to eq(0)
    end
  end

  describe "GET 'show'" do
    it "should be a successful request" do
      get 'show', id: collection.id

      expect(response.status).to be 200
    end
  end
end
