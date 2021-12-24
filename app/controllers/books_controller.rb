class BooksController < ApplicationController
  def index
    @books = Book.last_10_in_progress
  end
end
