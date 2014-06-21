require 'spec_helper'

describe CollectionsController, :type => :controller do

  before(:each) do
    @collection = create(:collection)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    describe "with valid params" do
      it "saves the new collection in the database" do
        expect {
          post :create, {:collection => attributes_for(:collection)}
        }.to change(Collection, :count).by(1)
      end

      it "redirects to the created collection" do
        post :create, {:collection => attributes_for(:collection)}
        response.should redirect_to(Collection.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @collection" do
        Collection.any_instance.stub(:save).and_return(false)
        post :create, {:collection => { "title" => "invalid value" }}
        assigns(:collection).should be_a_new(Collection)
      end

    end
  end

end
