require 'rails_helper'

RSpec.describe FlickrSearch, type: :model do

  let(:flickr_search_result) { double(:flickr_search_result) }
  let(:flickr_search) { FlickrSearch.new flickr_search_result }

  describe '#page' do

    it 'delegates on flickr search result' do
      expect(flickr_search_result).to receive(:page)
      flickr_search.page
    end
  end

  describe '#pages' do

    it 'delegates on flickr search result' do
      expect(flickr_search_result).to receive(:pages)
      flickr_search.pages
    end
  end
end
