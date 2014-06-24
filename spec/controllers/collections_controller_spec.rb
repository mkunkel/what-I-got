require 'spec_helper'

describe CollectionsController, :type => :controller do

  before(:each) do
    # @collection = create(:collection)
    @collection = Fabricate(:collection)
  end

  describe "GET 'index'" do
    it "returns http success" do
      pending "This may have occurred after before_filter in Application Controller"
      get 'index'
      expect(response).to be_success
    end
  end

end
