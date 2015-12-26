require 'rails_helper'

RSpec.describe FlickrSearch, type: :model do

  let(:flickr_search_result) { double(:flickr_search_result, photos: []) }
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

  describe '#next_page' do

    context 'given first page' do

      it 'returns the next page' do
        allow(flickr_search_result).to receive(:pages).and_return(5)
        allow(flickr_search_result).to receive(:page).and_return(1)
        expect(flickr_search.next_page).to be(2)
      end
    end

    context 'given last page' do

      it 'returns nil' do
        allow(flickr_search_result).to receive(:pages).and_return(5)
        allow(flickr_search_result).to receive(:page).and_return(5)
        expect(flickr_search.next_page).to be(nil)
      end
    end
  end

  describe '#prev_page' do

    context 'given first page' do

      it 'returns nil' do
        allow(flickr_search_result).to receive(:pages).and_return(5)
        allow(flickr_search_result).to receive(:page).and_return(1)
        expect(flickr_search.prev_page).to be(nil)
      end
    end

    context 'given last page' do

      it 'returns the previous page' do
        allow(flickr_search_result).to receive(:pages).and_return(5)
        allow(flickr_search_result).to receive(:page).and_return(5)
        expect(flickr_search.prev_page).to be(4)
      end
    end
  end
end
