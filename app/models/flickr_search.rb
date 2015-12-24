class FlickrSearch

  attr_reader :flickr_search_result

  def initialize(flickr_search_result)
    @flickr_search_result = flickr_search_result
  end

  def page
    flickr_search_result.page
  end

  def pages
    flickr_search_result.pages
  end
end
