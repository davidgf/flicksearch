require 'rails_helper'

feature 'Photo search' do
  scenario 'visitor fills in search form' do
    visit root_path
    fill_in 'search-box', with: 'bagan'
    click_button 'search'

    expect(page).to have_selector('img.flickr-photo', count: FlickrSearchService::PER_PAGE)
  end
end

feature 'Photo enlarge', :js => true do

  scenario 'visitor clicks on a photo' do
    visit search_path(text: 'bagan')
    photo = page.find(".flickr-photo", match: :first)
    photo.click
    expect(page).to have_overlay
    large_url = photo['data-large']
    expect(large_photo_src).to eq(large_url)
  end

  def have_overlay
    within(:css, '.overlay-container') do
      have_css('img.overlay')
    end
  end

  def large_photo_src
    page.find('img.overlay')['src']
  end
end
