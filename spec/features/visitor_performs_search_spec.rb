require 'rails_helper'

feature 'Visitor performs a photo search' do
  scenario 'with default params' do
    visit root_path
    fill_in 'search-box', with: 'bagan'
    click_button 'search'

    expect(page).to have_selector('img.flickr-photo', count: FlickrSearchService::PER_PAGE)
  end
end
