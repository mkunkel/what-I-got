require 'spec_helper'

describe CollectionsController, :type => :controller do

  before(:each) do
    @collection = Fabricate(:collection)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

end
