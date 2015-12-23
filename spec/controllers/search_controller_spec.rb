require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #search" do

    context "given no text" do
      it "redirects to home page" do
        get :search
        expect(response).to redirect_to root_path
      end
    end

    context "given a text search" do
      it "renders the search page" do
        get :search, text: 'don det'
        expect(response).to render_template(:search)
        search_result = assigns(:search_result)
        expect(search_result.photos.size).to be(FlickrSearchService::PER_PAGE)
      end
    end
  end

end
