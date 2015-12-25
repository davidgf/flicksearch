class FlickrSearch

  attr_reader :flickr_search_result
  attr_reader :photos

  def initialize(flickr_search_result)
    @flickr_search_result = flickr_search_result
    @photos = flickr_search_result.photos.map {|photo| FlickrPhoto.new photo }
  end

  def text
    flickr_search_result.options[:text]
  end

  def page
    flickr_search_result.page
  end

  def pages
    flickr_search_result.pages
  end

  def prev_page
    if page == 1
      nil
    else
      page - 1
    end
  end

  def next_page
    if page == pages
      nil
    else
      page + 1
    end
  end
end
