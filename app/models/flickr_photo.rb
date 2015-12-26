class FlickrPhoto

  def initialize(flickr_photo)
    @flickr_photo = flickr_photo
  end

  def thumbnail_url
    flickr_photo.url(:medium)
  end

  def large_url
    flickr_photo.url(:large)
  end

  private

  attr_reader :flickr_photo

end
