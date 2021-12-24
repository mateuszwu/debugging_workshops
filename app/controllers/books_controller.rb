class BooksController < ApplicationController
  def index
    @books = RecommendationsService.call
  end
end
