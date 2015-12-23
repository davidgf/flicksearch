class SearchController < ApplicationController
  def index
  end

  def search
  end

  private

  def search_params
    params.permit(:text)
  end
end
