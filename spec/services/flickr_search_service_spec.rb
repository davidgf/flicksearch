require 'rails_helper'

RSpec.describe FlickrSearchService do

  let(:text_search) { FlickrSearchService.new(text: 'bagan') }
  let(:text_search_result) { text_search.search }
  let(:page) { 3 }
  let(:paginated_text_search) { FlickrSearchService.new(text: 'bagan', page: page) }
  let(:paginated_text_search_result) { paginated_text_search.search }

  describe '#search' do

    context 'given a text search without page' do

      it 'returns the first page of results' do
        expect(text_search_result.page).to be(1)
        expect(text_search_result.photos.size).to be(FlickrSearchService::PER_PAGE)
      end
    end

    context 'given a text search with page' do

      it 'returns the specified page' do
        expect(paginated_text_search_result.page).to be(page)
      end
    end
  end

  describe '#search_params' do

    context 'given a text search' do

      it 'has text and extra params' do
        params = text_search.send(:search_params)
        expect(params).to include(:text, :extras, :page, :per_page)
      end
    end
  end

end
