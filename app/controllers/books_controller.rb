class BooksController < ApplicationController
  def index
    @books = BookWrapper.all_books
  end
end
