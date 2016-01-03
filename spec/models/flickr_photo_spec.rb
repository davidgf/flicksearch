require 'rails_helper'

RSpec.describe FlickrPhoto, type: :model do

  let(:flickr_fu_photo) { double(:flickr_fu_photo) }
  let(:flickr_photo) { FlickrPhoto.new flickr_fu_photo }

  describe '#thumbnail_url' do

    it 'delegates on flickr_fu photo' do
      expect(flickr_fu_photo).to receive(:url).with(:small_320)
      flickr_photo.thumbnail_url
    end
  end

  describe '#large_url' do

    it 'delegates on flickr_fu photo' do
      expect(flickr_fu_photo).to receive(:url).with(:large)
      flickr_photo.large_url
    end
  end
end
