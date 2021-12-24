class BooksController < ApplicationController
  def index
    @books = Book.last(10)
  end
end
