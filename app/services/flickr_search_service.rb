class FlickrSearchService

  PER_PAGE = 20

  attr_accessor :text, :page

  def initialize(args)
    @text = args.fetch(:text, '')
    @page = args.fetch(:page, 1)
  end

  def search
    client.photos.search search_params
  end

  private

  def search_params
    { text: text, page: page }.merge extra_params
  end

  def extra_params
    { extras: 'url_n,url_b', per_page: PER_PAGE }
  end

  def client
    @client ||= Flickr.new key: ENV['FLICKR_KEY'], secret: ENV['FLICKR_SECRET']
  end
end
