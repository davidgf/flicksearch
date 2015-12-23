class SearchController < ApplicationController
  def index
  end

  def search
    if params[:text]
      @search_result = FlickrSearchService.new(search_params).search
    else
      redirect_to root_path
    end
  end

  private

  def search_params
    params.permit(:text, :page)
  end
end
